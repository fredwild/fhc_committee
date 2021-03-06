class ReportsController < ApplicationController

  def index
    prepare_list()
    respond_to do |format|
      format.html {
        render :action => @ft_custom_action and return if @ft_custom_action
        render :action => 'list'
      }
      format.xml  { render :xml => @reports }
    end
  end

  def apply_to_checked_items
    if params[:action_to_perform] == 'Delete'    
        Report.destroy(params[:delchk].keys) if params[:delchk] && params[:delchk].keys.size > 0
    end 

    redirect_to :back
  end

  def replace_column_value
    if params[:old_value].empty?
        where_clause = "#{params[:field]} is null or #{params[:field]} = ''" 
    elsif params[:old_value].include?("%") || params[:old_value].include?("*")
        where_clause = "#{params[:field]} like '#{params[:old_value].gsub("*","%").strip}'"
    else
        where_clause = "#{params[:field]} = '#{params[:old_value].strip}'"
    end
    Report.update_all("#{params[:field]} = '#{params[:new_value].strip}'", where_clause)
    redirect_to :back
  end

  def delete_matching_rows
    if params[:value].empty?
        where_clause = "#{params[:field]} is null or #{params[:field]} = ''" 
    elsif params[:value].include?("%") || params[:value].include?("*")
        where_clause = "#{params[:field]} like '#{params[:value].gsub("*","%").strip}'"
    else
        where_clause = "#{params[:field]} = '#{params[:value].strip}'"
    end
    Report.delete_all(where_clause)
    redirect_to :back
  end

  def quick_add_items
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      for str_name in names do
        str_name.strip!
        Report.find_or_create_by_name(str_name)
      end
    end
    redirect_to :action => 'list'
  end

  def list_with_sort
    redirect_to params.merge(:action => 'list')
  end

  def list_without_sort
    params[:sort_field] = params[:sort_field2] = params[:sort_field3] = nil
    redirect_to params.merge(:action => 'list')
  end

  def list_with_filter
    params[:page] = "1"
    redirect_to params.merge(:action => 'list')
  end

  def list_without_filter
    params[:page] = "1"
    params[:search_field] = params[:search_field2] = params[:search_field3] = nil
    params[:search_str] = params[:search_str2] = params[:search_str3] = nil
    redirect_to params.merge(:action => 'list')
  end

  def list_by_page
    redirect_to params.merge(:action => 'list')
  end

  def block_list_by_page
    redirect_to params.merge(:action => 'block_list')
  end

  def list
    prepare_list()
    respond_to do |format|
      format.html {
        render :action => @ft_custom_action if @ft_custom_action
      }
      format.xml  { render :xml => @reports }
    end
  end

  def block_list
    prepare_list()
    render :action => @ft_custom_action if @ft_custom_action
  end

  def new
    @new_obj = @report = Report.new

    @ft_subject = "Report"
    @ft_activity = "New"

    if params && params[:redirect] 
        session[:post_create_redirect] = params[:redirect]
    end

    respond_to do |format|
      format.html { render :action => @ft_custom_action if @ft_custom_action }
      format.xml  { render :xml => @report }
    end
  end

  def set_context(load_related=true)
    @report = Report.find(params[:id])

    @ft_subject = "Report"
    @ft_activity = @report.iname
    
    load_related = false if (params[:action] == "show_properties")    # don't load related items if only showing properties
    return unless load_related

  end

  def show
    set_context()
    respond_to do |format|
      format.html { render :action => @ft_custom_action if @ft_custom_action }
      format.xml  { render :xml => @report }
    end
  end

  def show_properties
    set_context()
    render :partial => 'show_properties'
  end

  def show_related
    set_context()
    render :partial => 'show_related'
  end

  def get_related
    set_context()
    render :xml => { :message => "No such related items" }.to_xml(:root => "error") 
  end

  def show_as_doc
    set_context()
    render :action => @ft_custom_action if @ft_custom_action
  end

  def edit
    set_context()
    render :action => @ft_custom_action if @ft_custom_action
  end

  # returns true to indicate redirection has been queued
  def update_aggregator(new_obj,params)
    return false
  end

  def sanitize_params(hk)
    params[hk].each{|k,v| params[hk][k] = v.gsub("-- select --","")}  if params[hk]
    params[hk].each{|k,v| params[hk][k] = v.gsub(/HH:MM.*/,"")}       if params[hk]
  end

  def create
    sanitize_params(:report)
    @new_obj = @report = Report.new(params[:report])

    if ! ok_to_add_or_update?
        flash[:notice] = 'Not added. ' + @reason.to_s
        @ft_subject = "Report"
        @ft_activity = "New"
        render :action => 'new'
    else    
      respond_to do |format|
        if @report.save
          format.xml  { render :xml => @report, :status => :created, :location => @report }
          format.html {
            flash[:notice] = "#{@report.iname} was successfully created."
            redirected_to_aggregator = update_aggregator(@report,params)
            if ( ! redirected_to_aggregator ) && session[:post_create_redirect]
                url = session[:post_create_redirect] + "?report_id=" + @report.id.to_s + "&report_ids[]=" + @report.id.to_s 
                redirect_to url
                session[:post_create_redirect] = nil
            else 
                redirect_to :id => @report.id, :action => (params[:commit].to_s.include?("Another") ? 'new' : 'edit') if ! redirected_to_aggregator 
            end
          }
        else
          format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
          format.html {
            flash[:notice] = 'Report could not be created. See errors.'
            render :action => 'new'
          }
        end
      end
    end
  end

  def update
    @updated_obj = @report = Report.find(params[:id])
    sanitize_params(:report)

    if ! ok_to_add_or_update?
      flash[:notice] = 'Not updated. ' + @reason.to_s
      @ft_subject = "Report"
      @ft_activity = "Edit"
      redirect_to :action => 'edit', :id => @report and return
    end 

      respond_to do |format|
      if @report.update_attributes(params[:report])

        if session[:post_update_redirect] then
          redirect_to session[:post_update_redirect]
          session[:post_update_redirect] = nil
          return
        end

        format.xml  { head :ok }
        format.html {
          flash[:notice] = 'Report was successfully updated.'
          redirect_to :action => 'show', :id => @report
        }
      else
        format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
        format.html { 
          redirect_to :action => 'edit', :id => @report
        }
      end
    end
  end

  def ok_to_add_or_update?
    if params[:report][:name].to_s.empty?
      @reason = 'The name field can not be blank.'
      return false
    end
    return true
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    respond_to do |format|
      format.html {
        redirect_to :back
      }
      format.xml  { head :ok }
    end
  end


  def csv_upload
    # no need to prepare any data - just show the view to post against 'upload_csv'
  end

  def upload_csv

    # commented out - instead try to load the csv without an intermediate file
    #fn = "#{RAILS_ROOT}/uploads/report_data.csv"
    #File.open(fn, "wb") { |f| f.write(params[:csv_file].read) }
    #Report.load_csv_file(fn) if Report.respond_to? :load_csv_file

    Report.load_csv_str(params[:csv_file].read) if Report.respond_to? :load_csv_str
    
    redirect_to :action => 'list' 
  end

  def download_csv
    if params[:field_list].nil? || @user_is_admin
      attr_names = Report.value_attrs
        
    else
      attr_names = params[:field_list].to_s.split('|')
    end

    csv_string = String.new
    csv_string = attr_names.join(",") + "\n"

    # override visual pagination establishing the limit to 100,000 rows
    params[:page] = '1'
    params[:page_length] = '100000'

    prepare_list()

    all_objs = @reports      
    
    if all_objs.size > 0 then
      all_objs.each do |record| 
        csv_string << '"'+attr_names.collect{|s| record.get_attr_val(s,'csv').to_s.gsub("\"","\"\"")}.join('","')+'"' + "\n"
      end
    end
    send_data csv_string, :filename => 'report_data.csv', :type => 'text/csv'
  end 

  # --- 

  def show_queries
    @ft_subject = "Report"
    @ft_activity  = "Reports"

    @queries = Report.query_specs

    render :partial => 'fast_ops/queries', :layout => 'application'
  end

  def run_query
    @def_page_size ||= 50
    @page_size = params[:page_length].to_i > 0 ? params[:page_length].to_i : @def_page_size

    @page_no = [ params[:page].to_i, 1 ].max
    @page_clause = "LIMIT #{@page_size.to_s} OFFSET #{((@page_no-1)*@page_size).to_s}"

    @query = Report.query_specs[params[:query]]
    @sort_fields = params[:order_by] || (! @query[:order_by].to_s.empty? && @query[:order_by].join(",")) || @query[:cols][0]
    @where_clause = params[:where] || (@query[:where].to_s.length > 0 ? @query[:where] : nil)

    @base_sql = @query[:sql] + (@where_clause ? " WHERE #{@where_clause}" : "") 
    @count = Report.count_by_sql("SELECT COUNT(id) FROM (#{@base_sql}) AS row_data")
    
    @sql = @base_sql + (@sort_fields ? " ORDER BY #{@sort_fields}" : "") + (@page_clause ? " #{@page_clause}" : "") 
    @rows = Report.find_by_sql(@sql)

    @cols = @query[:cols] || (@rows.size > 0 && @rows[0].attributes.keys)

    @link_params = { :controller => 'reports', :action => 'show' }

    return @rows
  end

  def render_query_results
    @order_field = params[:order_by]
    params[:order_by] = quoted_name(@order_field) if params[:order_by]
    params[:order_by] += " #{params[:direction]}" if params[:direction]

    run_query()

    params[:order_by] = @order_field
    render :partial => 'fast_ops/query_results'
  end

  def before_prepare_list
    # override to set custom params and vars
  end

  def prepare_list
    orig_params = params.clone

    before_prepare_list()

    @ft_subject  = ( @ft_subject || "Report".pluralize )
    @ft_activity = ( @ft_activity || "All" )

    @order_field = ( params[:order_by] || "name" )
    @direction = ( params[:direction] || "ASC" )

    @query_param = ( params[:query] || "list_all" )
    params[:query] = @query_param
    
    params[:order_by] = quoted_name(@order_field) + " " + @direction

    @where_param = params[:where]  # save the original where param

    adjust_sorting_and_filtering_params(Report,params)
    @order_field = params[:sort_field].to_s unless params[:sort_field].to_s.empty?

    @reports = run_query()

    # restore original params passed to the server
    params.clear
    params.merge!(orig_params)
  end

  # --- 

  def show
    redirect_to params.merge({:action => 'run_report'})
  end

  def run_report
    set_context(false)

    query = @report.query.to_s.gsub(/\s+\ns+/,' ').gsub(/\s*;\s*$/,'')
    results = ActiveRecord::Base.connection.execute(query)

    @rows = @fields = @cols = []
    @rjust = {}
    @col_type = {}
    
    num_pat = /^[0-9\-.]+$/

    begin

      if results.kind_of?(Array) && results.size > 0 then

        @cols     = @fields = results.first.keys
        @rows     = results

      else

        if ! defined?(Mysql2) || ! results.kind_of?(Mysql2::Result) then
        # MySql adapter
          @fields = results.fetch_fields
          @cols   = @fields.collect{|f| f.name}

          @rjust = @fields.inject({}){|hsh,f| hsh[f.name] = (0..9).include?(f.type); hsh}

          results.each_hash{|r| @rows << r}
          results.free

        elsif results.kind_of?(Mysql2::Result) then
        # MySql2 adapter

          @cols  = results.fields
          @rows  = results.entries(:as => :hash)
          @rows[0].each{|k,v| @rjust[k] = (v.to_s =~ num_pat)}
        end


        if @rows.size > 0 then
          @rows[0].each{|k,v|
            @col_type[k] = begin
              k = k.downcase
              if (v.to_s =~ num_pat)
                (k["bal"] || k["balance"] || k["amt"] || k["amount"]) ? "money" : "number"
              else
                "string"
              end
            end
          }
        end

        # File.open("c:/temp/look.txt","w"){|f| f.write(@rjust.to_yaml + @col_type.to_yaml)}

      end

    rescue => e
      render :inline => "<pre>#{e.message}</pre>"
      return

    end

    respond_to { |format|
      format.html { render }
      format.csv  {
        contents = render
        file_name = "#{@report.name.to_s.downcase.gsub(/\s+/,"_")}_report.csv"
        send_data contents, :filename => file_name, :type => 'text/csv'
      }
    }

  end

#BEGIN-UID.usermethods

#END-UID.usermethods

end

