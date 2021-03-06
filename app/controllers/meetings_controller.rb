class MeetingsController < ApplicationController

  def index
    prepare_list()
    respond_to do |format|
      format.html {
        render :action => @ft_custom_action and return if @ft_custom_action
        render :action => 'list'
      }
      format.xml  { render :xml => @meetings }
    end
  end

  def apply_to_checked_items
    if params[:action_to_perform] == 'Delete'    
        Meeting.destroy(params[:delchk].keys) if params[:delchk] && params[:delchk].keys.size > 0
    end 

    redirect_to :back
  end

  def apply_seq_edits
    case request.method
      when :post
        Meeting.reassign_seq_nos(params[:seq_nos])
        redirect_to :back
      when :get
        @meetings = Meeting.find(:all, :order => 'seq_no')
    end
  end

  def swap_seq_nos
    obj1 = Meeting.find(params[:obj1_id])
    obj2 = Meeting.find(params[:obj2_id])

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
    Meeting.update_all("#{params[:field]} = '#{params[:new_value].strip}'", where_clause)
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
    Meeting.delete_all(where_clause)
    redirect_to :back
  end

  def quick_add_items
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      for str_name in names do
        str_name.strip!
        Meeting.find_or_create_by_name(str_name)
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
      format.xml  { render :xml => @meetings }
    end
  end

  def block_list
    prepare_list()
    render :action => @ft_custom_action if @ft_custom_action
  end

  def new
    @new_obj = @meeting = Meeting.new

    @ft_subject = "Meeting"
    @ft_activity = "New"

    if params && params[:redirect] 
        session[:post_create_redirect] = params[:redirect]
    end

    respond_to do |format|
      format.html { render :action => @ft_custom_action if @ft_custom_action }
      format.xml  { render :xml => @meeting }
    end
  end

  def set_context(load_related=true)
    @meeting = Meeting.find(params[:id])

    @ft_subject = "Meeting"
    @ft_activity = @meeting.iname
    
    load_related = false if (params[:action] == "show_properties")    # don't load related items if only showing properties
    return unless load_related

    @order_field = get_order_field(params,'meeting','invitees','role_name')
    @id_set = @meeting.send("#{'invitees'.singularize}_ids").concat(["0"]).join(",")
    @invitees = CommitteeRole.find_by_sql(%Q~select * from #{CommitteeRole.default_query("committee_role.id in (#{@id_set})")} order by #{quoted_name(@order_field) + " " + (params[:direction] || "asc")}~)

    @order_field = get_order_field(params,'meeting','resources','name')
    @id_set = @meeting.send("#{'resources'.singularize}_ids").concat(["0"]).join(",")
    @resources = Resource.find_by_sql(%Q~select * from #{Resource.default_query("resource.id in (#{@id_set})")} order by #{quoted_name(@order_field) + " " + (params[:direction] || "asc")}~)

    @order_field = get_order_field(params,'meeting','tasks_addressed','name')
    @id_set = @meeting.send("#{'tasks_addressed'.singularize}_ids").concat(["0"]).join(",")
    @tasks_addressed = TaskObj.find_by_sql(%Q~select * from #{TaskObj.default_query("task_obj.id in (#{@id_set})")} order by #{quoted_name(@order_field) + " " + (params[:direction] || "asc")}~)

    @month = @meeting.month

    @facilitator = @meeting.facilitator

  end

  def show
    set_context()
    respond_to do |format|
      format.html { render :action => @ft_custom_action if @ft_custom_action }
      format.xml  { render :xml => @meeting }
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
    if params[:relname].to_s.underscore == 'invitees' then
      render :xml => @meeting.invitees.find(:all)
      return
    end
    if params[:relname].to_s.underscore == 'resources' then
      render :xml => @meeting.resources.find(:all)
      return
    end
    if params[:relname].to_s.underscore == 'tasks_addressed' then
      render :xml => @meeting.tasks_addressed.find(:all)
      return
    end
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
    sanitize_params(:meeting)
    @new_obj = @meeting = Meeting.new(params[:meeting])

    if ! ok_to_add_or_update?
        flash[:notice] = 'Not added. ' + @reason.to_s
        @ft_subject = "Meeting"
        @ft_activity = "New"
        render :action => 'new'
    else    
      respond_to do |format|
        if @meeting.save
          format.xml  { render :xml => @meeting, :status => :created, :location => @meeting }
          format.html {
            flash[:notice] = "#{@meeting.iname} was successfully created."
            redirected_to_aggregator = update_aggregator(@meeting,params)
            if ( ! redirected_to_aggregator ) && session[:post_create_redirect]
                url = session[:post_create_redirect] + "?meeting_id=" + @meeting.id.to_s + "&meeting_ids[]=" + @meeting.id.to_s 
                redirect_to url
                session[:post_create_redirect] = nil
            else 
                redirect_to :id => @meeting.id, :action => (params[:commit].to_s.include?("Another") ? 'new' : 'edit') if ! redirected_to_aggregator 
            end
          }

            if params[:meeting][:seq_no].to_s.empty? then
              @meeting.seq_no = @meeting.id
              @meeting.save()
            end
        else
          format.xml  { render :xml => @meeting.errors, :status => :unprocessable_entity }
          format.html {
            flash[:notice] = 'Meeting could not be created. See errors.'
            render :action => 'new'
          }
        end
      end
    end
  end

  def update
    @updated_obj = @meeting = Meeting.find(params[:id])
    sanitize_params(:meeting)

    if ! ok_to_add_or_update?
      flash[:notice] = 'Not updated. ' + @reason.to_s
      @ft_subject = "Meeting"
      @ft_activity = "Edit"
      redirect_to :action => 'edit', :id => @meeting and return
    end 

      respond_to do |format|
      if @meeting.update_attributes(params[:meeting])

        if session[:post_update_redirect] then
          redirect_to session[:post_update_redirect]
          session[:post_update_redirect] = nil
          return
        end

        format.xml  { head :ok }
        format.html {
          flash[:notice] = 'Meeting was successfully updated.'
          redirect_to :action => 'show', :id => @meeting
        }
      else
        format.xml  { render :xml => @meeting.errors, :status => :unprocessable_entity }
        format.html { 
          redirect_to :action => 'edit', :id => @meeting
        }
      end
    end
  end

  def ok_to_add_or_update?
    if params[:meeting][:name].to_s.empty?
      @reason = 'The name field can not be blank.'
      return false
    end
    return true
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    respond_to do |format|
      format.html {
        redirect_to :back
      }
      format.xml  { head :ok }
    end
  end


  # -------------------------------------------------

  def add_to_invitees
    @ft_subject = "Meeting"
    @ft_activity = "Select Committee Role".pluralize

    @meeting = Meeting.find(params[:id])
    @committee_roles = CommitteeRole.choices_for(@meeting,'invitees')
    @committee_roles = @committee_roles - [ @meeting ] 
    @my_invitees = @meeting.invitees
    @committee_roles.delete_if { |a| @my_invitees.include?(a) }
  end
  
  def update_invitees
    @meeting = Meeting.find(params[:id])
    @invitees = [ CommitteeRole.find(params[:committee_role_ids]) ] if params[:committee_role_ids]
    @meeting.invitees << @invitees if @invitees
    redirect_to :controller => @meeting.ctrlr_name, :action => 'edit', :id => @meeting, :anchor => 'invitees'
  end

  def remove_from_invitees
    @meeting = Meeting.find(params[:id])
    @invitees = CommitteeRole.find(params[:committee_role_id])
    @meeting.invitees.delete @invitees
    redirect_to :controller => @meeting.ctrlr_name, :action => 'edit', :id => @meeting, :anchor => 'invitees'
  end

  def quick_add_invitees
    @meeting = Meeting.find(params[:id])
    
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      existing_committee_roles = @meeting.invitees.find(:all)
      for str_name in names do
        str_name.strip!
        new_obj = CommitteeRole.find_or_create_by_role_name(str_name)
        @meeting.invitees << new_obj unless existing_committee_roles.include?(new_obj)
      end
    end
    
    redirect_to :action => 'edit', :id => @meeting.id
  end


  # -------------------------------------------------

  def add_to_resources
    @ft_subject = "Meeting"
    @ft_activity = "Select Resource".pluralize

    @meeting = Meeting.find(params[:id])
    @resources = Resource.choices_for(@meeting,'resources')
    @resources = @resources - [ @meeting ] 
    @my_resources = @meeting.resources
    @resources.delete_if { |a| @my_resources.include?(a) }
  end
  
  def update_resources
    @meeting = Meeting.find(params[:id])
    @resources = [ Resource.find(params[:resource_ids]) ] if params[:resource_ids]
    @meeting.resources << @resources if @resources
    redirect_to :controller => @meeting.ctrlr_name, :action => 'edit', :id => @meeting, :anchor => 'resources'
  end

  def remove_from_resources
    @meeting = Meeting.find(params[:id])
    @resources = Resource.find(params[:resource_id])
    @meeting.resources.delete @resources
    redirect_to :controller => @meeting.ctrlr_name, :action => 'edit', :id => @meeting, :anchor => 'resources'
  end

  def quick_add_resources
    @meeting = Meeting.find(params[:id])
    
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      existing_resources = @meeting.resources.find(:all)
      for str_name in names do
        str_name.strip!
        new_obj = Resource.find_or_create_by_name(str_name)
        @meeting.resources << new_obj unless existing_resources.include?(new_obj)
      end
    end
    
    redirect_to :action => 'edit', :id => @meeting.id
  end


  # -------------------------------------------------

  def add_to_tasks_addressed
    @ft_subject = "Meeting"
    @ft_activity = "Select Task".pluralize

    @meeting = Meeting.find(params[:id])
    @task_objs = TaskObj.choices_for(@meeting,'tasks_addressed')
    @task_objs = @task_objs - [ @meeting ] 
    @my_tasks_addressed = @meeting.tasks_addressed
    @task_objs.delete_if { |a| @my_tasks_addressed.include?(a) }
  end
  
  def update_tasks_addressed
    @meeting = Meeting.find(params[:id])
    @tasks_addressed = [ TaskObj.find(params[:task_obj_ids]) ] if params[:task_obj_ids]
    @meeting.tasks_addressed << @tasks_addressed if @tasks_addressed
    redirect_to :controller => @meeting.ctrlr_name, :action => 'edit', :id => @meeting, :anchor => 'tasks_addressed'
  end

  def remove_from_tasks_addressed
    @meeting = Meeting.find(params[:id])
    @tasks_addressed = TaskObj.find(params[:task_obj_id])
    @meeting.tasks_addressed.delete @tasks_addressed
    redirect_to :controller => @meeting.ctrlr_name, :action => 'edit', :id => @meeting, :anchor => 'tasks_addressed'
  end

  def quick_add_tasks_addressed
    @meeting = Meeting.find(params[:id])
    
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      existing_task_objs = @meeting.tasks_addressed.find(:all)
      for str_name in names do
        str_name.strip!
        new_obj = TaskObj.find_or_create_by_name(str_name)
        @meeting.tasks_addressed << new_obj unless existing_task_objs.include?(new_obj)
      end
    end
    
    redirect_to :action => 'edit', :id => @meeting.id
  end


  # -------------------------------------------------

  def add_to_month
    @ft_subject = "Meeting"
    @ft_activity = "Select Month"

    @meeting = Meeting.find(params[:id])
    @months = Month.choices_for(@meeting,'month')
    @months = @months - [ @meeting ]
    @my_month = @meeting.month
    @months.delete(@my_month) if @my_month
  end
  
  def update_month
    @meeting = Meeting.find(params[:id])
    @my_month = params[:month_id] && params[:month_id] != "" ? Month.find(params[:month_id]) : nil 
    @meeting.month = @my_month 
    @meeting.save
    redirect_to :controller => @meeting.ctrlr_name, :action => 'edit', :id => @meeting, :anchor => 'month'
  end


  # -------------------------------------------------

  def add_to_facilitator
    @ft_subject = "Meeting"
    @ft_activity = "Select Committee Role"

    @meeting = Meeting.find(params[:id])
    @committee_roles = CommitteeRole.choices_for(@meeting,'facilitator')
    @committee_roles = @committee_roles - [ @meeting ]
    @my_facilitator = @meeting.facilitator
    @committee_roles.delete(@my_facilitator) if @my_facilitator
  end
  
  def update_facilitator
    @meeting = Meeting.find(params[:id])
    @my_facilitator = params[:committee_role_id] && params[:committee_role_id] != "" ? CommitteeRole.find(params[:committee_role_id]) : nil 
    @meeting.facilitator = @my_facilitator 
    @meeting.save
    redirect_to :controller => @meeting.ctrlr_name, :action => 'edit', :id => @meeting, :anchor => 'facilitator'
  end


  def csv_upload
    # no need to prepare any data - just show the view to post against 'upload_csv'
  end

  def upload_csv

    # commented out - instead try to load the csv without an intermediate file
    #fn = "#{RAILS_ROOT}/uploads/meeting_data.csv"
    #File.open(fn, "wb") { |f| f.write(params[:csv_file].read) }
    #Meeting.load_csv_file(fn) if Meeting.respond_to? :load_csv_file

    Meeting.load_csv_str(params[:csv_file].read) if Meeting.respond_to? :load_csv_str
    
    redirect_to :action => 'list' 
  end

  def download_csv
    if params[:field_list].nil? || @user_is_admin
      attr_names = Meeting.value_attrs
        
      adjacent_objs = [:month,:facilitator]
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

    all_objs = @meetings      
    
    if all_objs.size > 0 then
      all_objs.each do |record| 
        csv_string << '"'+attr_names.collect{|s| record.get_attr_val(s,'csv').to_s.gsub("\"","\"\"")}.join('","')+'"' + "\n"
      end
    end
    send_data csv_string, :filename => 'meeting_data.csv', :type => 'text/csv'
  end 

  # --- 

  def show_queries
    @ft_subject = "Meeting"
    @ft_activity  = "Reports"

    @queries = Meeting.query_specs

    render :partial => 'fast_ops/queries', :layout => 'application'
  end

  def run_query
    @def_page_size ||= 50
    @page_size = params[:page_length].to_i > 0 ? params[:page_length].to_i : @def_page_size

    @page_no = [ params[:page].to_i, 1 ].max
    @page_clause = "LIMIT #{@page_size.to_s} OFFSET #{((@page_no-1)*@page_size).to_s}"

    @query = Meeting.query_specs[params[:query]]
    @sort_fields = params[:order_by] || (! @query[:order_by].to_s.empty? && @query[:order_by].join(",")) || @query[:cols][0]
    @where_clause = params[:where] || (@query[:where].to_s.length > 0 ? @query[:where] : nil)

    @base_sql = @query[:sql] + (@where_clause ? " WHERE #{@where_clause}" : "") 
    @count = Meeting.count_by_sql("SELECT COUNT(id) FROM (#{@base_sql}) AS row_data")
    
    @sql = @base_sql + (@sort_fields ? " ORDER BY #{@sort_fields}" : "") + (@page_clause ? " #{@page_clause}" : "") 
    @rows = Meeting.find_by_sql(@sql)

    @cols = @query[:cols] || (@rows.size > 0 && @rows[0].attributes.keys)

    @link_params = { :controller => 'meetings', :action => 'show' }

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

    @ft_subject  = ( @ft_subject || "Meeting".pluralize )
    @ft_activity = ( @ft_activity || "All" )

    @order_field = ( params[:order_by] || "seq_no" )
    @direction = ( params[:direction] || "ASC" )

    @query_param = ( params[:query] || "list_all" )
    params[:query] = @query_param
    
    params[:order_by] = quoted_name(@order_field) + " " + @direction

    @where_param = params[:where]  # save the original where param

    adjust_sorting_and_filtering_params(Meeting,params)
    @order_field = params[:sort_field].to_s unless params[:sort_field].to_s.empty?

    @meetings = run_query()

    # restore original params passed to the server
    params.clear
    params.merge!(orig_params)
  end

  # --- 

#BEGIN-UID.usermethods

#END-UID.usermethods

end

