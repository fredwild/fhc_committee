class AnnouncementsController < ApplicationController

  def index
    prepare_list()
    respond_to do |format|
      format.html {
        render :action => @ft_custom_action and return if @ft_custom_action
        render :action => 'list'
      }
      format.xml  { render :xml => @announcements }
    end
  end

  def apply_to_checked_items
    if params[:action_to_perform] == 'Delete'    
        Announcement.destroy(params[:delchk].keys) if params[:delchk] && params[:delchk].keys.size > 0
    end 

    redirect_to :back
  end

  def apply_seq_edits
    case request.method
      when :post
        Announcement.reassign_seq_nos(params[:seq_nos])
        redirect_to :back
      when :get
        @announcements = Announcement.find(:all, :order => 'seq_no')
    end
  end

  def swap_seq_nos
    obj1 = Announcement.find(params[:obj1_id])
    obj2 = Announcement.find(params[:obj2_id])

    obj1.seq_no, obj2.seq_no = obj2.seq_no.to_i, obj1.seq_no.to_i

    obj1.save()
    obj2.save()

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
    Announcement.update_all("#{params[:field]} = '#{params[:new_value].strip}'", where_clause)
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
    Announcement.delete_all(where_clause)
    redirect_to :back
  end

  def quick_add_items
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      for str_name in names do
        str_name.strip!
        Announcement.find_or_create_by_topic(str_name)
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
      format.xml  { render :xml => @announcements }
    end
  end

  def block_list
    prepare_list()
    render :action => @ft_custom_action if @ft_custom_action
  end

  def new
    @new_obj = @announcement = Announcement.new

    @ft_subject = "Announcement"
    @ft_activity = "New"

    if params && params[:redirect] 
        session[:post_create_redirect] = params[:redirect]
    end

    respond_to do |format|
      format.html { render :action => @ft_custom_action if @ft_custom_action }
      format.xml  { render :xml => @announcement }
    end
  end

  def set_context(load_related=true)
    @announcement = Announcement.find(params[:id])

    @ft_subject = "Announcement"
    @ft_activity = @announcement.iname
    
    load_related = false if (params[:action] == "show_properties")    # don't load related items if only showing properties
    return unless load_related

    @task = @announcement.task

  end

  def show
    set_context()
    respond_to do |format|
      format.html { render :action => @ft_custom_action if @ft_custom_action }
      format.xml  { render :xml => @announcement }
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
    sanitize_params(:announcement)
    @new_obj = @announcement = Announcement.new(params[:announcement])

    if ! ok_to_add_or_update?
        flash[:notice] = 'Not added. ' + @reason.to_s
        @ft_subject = "Announcement"
        @ft_activity = "New"
        render :action => 'new'
    else    
      respond_to do |format|
        if @announcement.save
          format.xml  { render :xml => @announcement, :status => :created, :location => @announcement }
          format.html {
            flash[:notice] = "#{@announcement.iname} was successfully created."
            redirected_to_aggregator = update_aggregator(@announcement,params)
            if ( ! redirected_to_aggregator ) && session[:post_create_redirect]
                url = session[:post_create_redirect] + "?announcement_id=" + @announcement.id.to_s + "&announcement_ids[]=" + @announcement.id.to_s 
                redirect_to url
                session[:post_create_redirect] = nil
            else 
                redirect_to :id => @announcement.id, :action => (params[:commit].to_s.include?("Another") ? 'new' : 'edit') if ! redirected_to_aggregator 
            end
          }

            if params[:announcement][:seq_no].to_s.empty? then
              @announcement.seq_no = @announcement.id
              @announcement.save()
            end
        else
          format.xml  { render :xml => @announcement.errors, :status => :unprocessable_entity }
          format.html {
            flash[:notice] = 'Announcement could not be created. See errors.'
            render :action => 'new'
          }
        end
      end
    end
  end

  def update
    @updated_obj = @announcement = Announcement.find(params[:id])
    sanitize_params(:announcement)

    if ! ok_to_add_or_update?
      flash[:notice] = 'Not updated. ' + @reason.to_s
      @ft_subject = "Announcement"
      @ft_activity = "Edit"
      redirect_to :action => 'edit', :id => @announcement and return
    end 

      respond_to do |format|
      if @announcement.update_attributes(params[:announcement])

        if session[:post_update_redirect] then
          redirect_to session[:post_update_redirect]
          session[:post_update_redirect] = nil
          return
        end

        format.xml  { head :ok }
        format.html {
          flash[:notice] = 'Announcement was successfully updated.'
          redirect_to :action => 'show', :id => @announcement
        }
      else
        format.xml  { render :xml => @announcement.errors, :status => :unprocessable_entity }
        format.html { 
          redirect_to :action => 'edit', :id => @announcement
        }
      end
    end
  end

  def ok_to_add_or_update?
    if params[:announcement][:topic].to_s.empty?
      @reason = 'The topic field can not be blank.'
      return false
    end
    return true
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy
    respond_to do |format|
      format.html {
        redirect_to :back
      }
      format.xml  { head :ok }
    end
  end


  # -------------------------------------------------

  def add_to_task
    @ft_subject = "Announcement"
    @ft_activity = "Select Task"

    @announcement = Announcement.find(params[:id])
    @task_objs = TaskObj.choices_for(@announcement,'task')
    @task_objs = @task_objs - [ @announcement ]
    @my_task = @announcement.task
    @task_objs.delete(@my_task) if @my_task
  end
  
  def update_task
    @announcement = Announcement.find(params[:id])
    @my_task = params[:task_obj_id] && params[:task_obj_id] != "" ? TaskObj.find(params[:task_obj_id]) : nil 
    @announcement.task = @my_task 
    @announcement.save
    redirect_to :controller => @announcement.ctrlr_name, :action => 'edit', :id => @announcement, :anchor => 'task'
  end


  def csv_upload
    # no need to prepare any data - just show the view to post against 'upload_csv'
  end

  def upload_csv

    # commented out - instead try to load the csv without an intermediate file
    #fn = "#{RAILS_ROOT}/uploads/announcement_data.csv"
    #File.open(fn, "wb") { |f| f.write(params[:csv_file].read) }
    #Announcement.load_csv_file(fn) if Announcement.respond_to? :load_csv_file

    Announcement.load_csv_str(params[:csv_file].read) if Announcement.respond_to? :load_csv_str
    
    redirect_to :action => 'list' 
  end

  def download_csv
    if params[:field_list].nil? || @user_is_admin
      attr_names = Announcement.value_attrs
        
      adjacent_objs = [:task]
      attr_names << adjacent_objs.collect{|c| c.to_s}
      attr_names = attr_names.flatten

    else
      attr_names = params[:field_list].to_s.split('|')
    end

    csv_string = String.new
    csv_string = attr_names.join(",") + "\n"

    # override visual pagination establishing the limit to 100,000 rows
    params[:page] = '1'
    params[:page_length] = '100000'

    prepare_list()

    all_objs = @announcements      
    
    if all_objs.size > 0 then
      all_objs.each do |record| 
        csv_string << '"'+attr_names.collect{|s| record.get_attr_val(s,'csv').to_s.gsub("\"","\"\"")}.join('","')+'"' + "\n"
      end
    end
    send_data csv_string, :filename => 'announcement_data.csv', :type => 'text/csv'
  end 

  # --- 

  def show_queries
    @ft_subject = "Announcement"
    @ft_activity  = "Reports"

    @queries = Announcement.query_specs

    render :partial => 'fast_ops/queries', :layout => 'application'
  end

  def run_query
    @def_page_size ||= 50
    @page_size = params[:page_length].to_i > 0 ? params[:page_length].to_i : @def_page_size

    @page_no = [ params[:page].to_i, 1 ].max
    @page_clause = "LIMIT #{@page_size.to_s} OFFSET #{((@page_no-1)*@page_size).to_s}"

    @query = Announcement.query_specs[params[:query]]
    @sort_fields = params[:order_by] || (! @query[:order_by].to_s.empty? && @query[:order_by].join(",")) || @query[:cols][0]
    @where_clause = params[:where] || (@query[:where].to_s.length > 0 ? @query[:where] : nil)

    @base_sql = @query[:sql] + (@where_clause ? " WHERE #{@where_clause}" : "") 
    @count = Announcement.count_by_sql("SELECT COUNT(id) FROM (#{@base_sql}) AS row_data")
    
    @sql = @base_sql + (@sort_fields ? " ORDER BY #{@sort_fields}" : "") + (@page_clause ? " #{@page_clause}" : "") 
    @rows = Announcement.find_by_sql(@sql)

    @cols = @query[:cols] || (@rows.size > 0 && @rows[0].attributes.keys)

    @link_params = { :controller => 'announcements', :action => 'show' }

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

    @ft_subject  = ( @ft_subject || "Announcement".pluralize )
    @ft_activity = ( @ft_activity || "All" )

    @order_field = ( params[:order_by] || "seq_no" )
    @direction = ( params[:direction] || "ASC" )

    @query_param = ( params[:query] || "list_all" )
    params[:query] = @query_param
    
    params[:order_by] = quoted_name(@order_field) + " " + @direction

    @where_param = params[:where]  # save the original where param

    adjust_sorting_and_filtering_params(Announcement,params)
    @order_field = params[:sort_field].to_s unless params[:sort_field].to_s.empty?

    @announcements = run_query()

    # restore original params passed to the server
    params.clear
    params.merge!(orig_params)
  end

  # --- 

#BEGIN-UID.usermethods

#END-UID.usermethods

end

