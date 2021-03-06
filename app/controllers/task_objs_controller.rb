class TaskObjsController < ApplicationController

  def index
    prepare_list()
    respond_to do |format|
      format.html {
        render :action => @ft_custom_action and return if @ft_custom_action
        render :action => 'list'
      }
      format.xml  { render :xml => @task_objs }
    end
  end

  def apply_to_checked_items
    if params[:action_to_perform] == 'Delete'    
        TaskObj.destroy(params[:delchk].keys) if params[:delchk] && params[:delchk].keys.size > 0
    end 

    redirect_to :back
  end

  def apply_seq_edits
    case request.method
      when :post
        TaskObj.reassign_seq_nos(params[:seq_nos])
        redirect_to :back
      when :get
        @task_objs = TaskObj.find(:all, :order => 'seq_no')
    end
  end

  def swap_seq_nos
    obj1 = TaskObj.find(params[:obj1_id])
    obj2 = TaskObj.find(params[:obj2_id])

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
    TaskObj.update_all("#{params[:field]} = '#{params[:new_value].strip}'", where_clause)
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
    TaskObj.delete_all(where_clause)
    redirect_to :back
  end

  def quick_add_items
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      for str_name in names do
        str_name.strip!
        TaskObj.find_or_create_by_name(str_name)
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
      format.xml  { render :xml => @task_objs }
    end
  end

  def block_list
    prepare_list()
    render :action => @ft_custom_action if @ft_custom_action
  end

  def new
    @new_obj = @task_obj = TaskObj.new

    @ft_subject = "Task"
    @ft_activity = "New"

    if params && params[:redirect] 
        session[:post_create_redirect] = params[:redirect]
    end

    respond_to do |format|
      format.html { render :action => @ft_custom_action if @ft_custom_action }
      format.xml  { render :xml => @task_obj }
    end
  end

  def set_context(load_related=true)
    @task_obj = TaskObj.find(params[:id])

    @ft_subject = "Task"
    @ft_activity = @task_obj.iname
    
    load_related = false if (params[:action] == "show_properties")    # don't load related items if only showing properties
    return unless load_related

    @order_field = get_order_field(params,'task_obj','documents','name')
    @id_set = @task_obj.send("#{'documents'.singularize}_ids").concat(["0"]).join(",")
    @documents = Document.find_by_sql(%Q~select * from #{Document.default_query("document.id in (#{@id_set})")} order by #{quoted_name(@order_field) + " " + (params[:direction] || "asc")}~)

    @order_field = get_order_field(params,'task_obj','announcements','topic')
    @id_set = @task_obj.send("#{'announcements'.singularize}_ids").concat(["0"]).join(",")
    @announcements = Announcement.find_by_sql(%Q~select * from #{Announcement.default_query("announcement.id in (#{@id_set})")} order by #{quoted_name(@order_field) + " " + (params[:direction] || "asc")}~)

    @order_field = get_order_field(params,'task_obj','follow_on_tasks','name')
    @id_set = @task_obj.send("#{'follow_on_tasks'.singularize}_ids").concat(["0"]).join(",")
    @follow_on_tasks = TaskObj.find_by_sql(%Q~select * from #{TaskObj.default_query("task_obj.id in (#{@id_set})")} order by #{quoted_name(@order_field) + " " + (params[:direction] || "asc")}~)

    @order_field = get_order_field(params,'task_obj','resources','name')
    @id_set = @task_obj.send("#{'resources'.singularize}_ids").concat(["0"]).join(",")
    @resources = Resource.find_by_sql(%Q~select * from #{Resource.default_query("resource.id in (#{@id_set})")} order by #{quoted_name(@order_field) + " " + (params[:direction] || "asc")}~)

    @order_field = get_order_field(params,'task_obj','functions','name')
    @id_set = @task_obj.send("#{'functions'.singularize}_ids").concat(["0"]).join(",")
    @functions = WebsiteFunction.find_by_sql(%Q~select * from #{WebsiteFunction.default_query("website_function.id in (#{@id_set})")} order by #{quoted_name(@order_field) + " " + (params[:direction] || "asc")}~)

    @month = @task_obj.month

    @meeting = @task_obj.meeting

    @predecessor = @task_obj.predecessor

    @commitee = @task_obj.commitee

    @committee_role = @task_obj.committee_role

  end

  def show
    set_context()
    respond_to do |format|
      format.html { render :action => @ft_custom_action if @ft_custom_action }
      format.xml  { render :xml => @task_obj }
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
    if params[:relname].to_s.underscore == 'documents' then
      render :xml => @task_obj.documents.find(:all)
      return
    end
    if params[:relname].to_s.underscore == 'announcements' then
      render :xml => @task_obj.announcements.find(:all)
      return
    end
    if params[:relname].to_s.underscore == 'follow_on_tasks' then
      render :xml => @task_obj.follow_on_tasks.find(:all)
      return
    end
    if params[:relname].to_s.underscore == 'resources' then
      render :xml => @task_obj.resources.find(:all)
      return
    end
    if params[:relname].to_s.underscore == 'functions' then
      render :xml => @task_obj.functions.find(:all)
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
    sanitize_params(:task_obj)
    @new_obj = @task_obj = TaskObj.new(params[:task_obj])

    if ! ok_to_add_or_update?
        flash[:notice] = 'Not added. ' + @reason.to_s
        @ft_subject = "Task"
        @ft_activity = "New"
        render :action => 'new'
    else    
      respond_to do |format|
        if @task_obj.save
          format.xml  { render :xml => @task_obj, :status => :created, :location => @task_obj }
          format.html {
            flash[:notice] = "#{@task_obj.iname} was successfully created."
            redirected_to_aggregator = update_aggregator(@task_obj,params)
            if ( ! redirected_to_aggregator ) && session[:post_create_redirect]
                url = session[:post_create_redirect] + "?task_obj_id=" + @task_obj.id.to_s + "&task_obj_ids[]=" + @task_obj.id.to_s 
                redirect_to url
                session[:post_create_redirect] = nil
            else 
                redirect_to :id => @task_obj.id, :action => (params[:commit].to_s.include?("Another") ? 'new' : 'edit') if ! redirected_to_aggregator 
            end
          }

            if params[:task_obj][:seq_no].to_s.empty? then
              @task_obj.seq_no = @task_obj.id
              @task_obj.save()
            end
        else
          format.xml  { render :xml => @task_obj.errors, :status => :unprocessable_entity }
          format.html {
            flash[:notice] = 'Task could not be created. See errors.'
            render :action => 'new'
          }
        end
      end
    end
  end

  def update
    @updated_obj = @task_obj = TaskObj.find(params[:id])
    sanitize_params(:task_obj)

    if ! ok_to_add_or_update?
      flash[:notice] = 'Not updated. ' + @reason.to_s
      @ft_subject = "Task"
      @ft_activity = "Edit"
      redirect_to :action => 'edit', :id => @task_obj and return
    end 

      respond_to do |format|
      if @task_obj.update_attributes(params[:task_obj])

        if session[:post_update_redirect] then
          redirect_to session[:post_update_redirect]
          session[:post_update_redirect] = nil
          return
        end

        format.xml  { head :ok }
        format.html {
          flash[:notice] = 'Task was successfully updated.'
          redirect_to :action => 'show', :id => @task_obj
        }
      else
        format.xml  { render :xml => @task_obj.errors, :status => :unprocessable_entity }
        format.html { 
          redirect_to :action => 'edit', :id => @task_obj
        }
      end
    end
  end

  def ok_to_add_or_update?
    if params[:task_obj][:name].to_s.empty?
      @reason = 'The name field can not be blank.'
      return false
    end
    return true
  end

  def destroy
    @task_obj = TaskObj.find(params[:id])
    @task_obj.destroy
    respond_to do |format|
      format.html {
        redirect_to :back
      }
      format.xml  { head :ok }
    end
  end


  # -------------------------------------------------

  def add_to_documents
    @ft_subject = "Task"
    @ft_activity = "Select Document".pluralize

    @task_obj = TaskObj.find(params[:id])
    @documents = Document.choices_for(@task_obj,'documents')
    @documents = @documents - [ @task_obj ] 
    @my_documents = @task_obj.documents
    @documents.delete_if { |a| @my_documents.include?(a) }
  end
  
  def update_documents
    @task_obj = TaskObj.find(params[:id])
    @documents = [ Document.find(params[:document_ids]) ] if params[:document_ids]
    @task_obj.documents << @documents if @documents
    redirect_to :controller => @task_obj.ctrlr_name, :action => 'edit', :id => @task_obj, :anchor => 'documents'
  end

  def remove_from_documents
    @task_obj = TaskObj.find(params[:id])
    @documents = Document.find(params[:document_id])
    @task_obj.documents.delete @documents
    redirect_to :controller => @task_obj.ctrlr_name, :action => 'edit', :id => @task_obj, :anchor => 'documents'
  end

  def quick_add_documents
    @task_obj = TaskObj.find(params[:id])
    
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      existing_documents = @task_obj.documents.find(:all)
      for str_name in names do
        str_name.strip!
        new_obj = Document.find_or_create_by_name(str_name)
        @task_obj.documents << new_obj unless existing_documents.include?(new_obj)
      end
    end
    
    redirect_to :action => 'edit', :id => @task_obj.id
  end


  # -------------------------------------------------

  def add_to_announcements
    @ft_subject = "Task"
    @ft_activity = "Select Announcement".pluralize

    @task_obj = TaskObj.find(params[:id])
    @announcements = Announcement.choices_for(@task_obj,'announcements')
    @announcements = @announcements - [ @task_obj ] 
    @my_announcements = @task_obj.announcements
    @announcements.delete_if { |a| @my_announcements.include?(a) }
  end
  
  def update_announcements
    @task_obj = TaskObj.find(params[:id])
    @announcements = [ Announcement.find(params[:announcement_ids]) ] if params[:announcement_ids]
    @task_obj.announcements << @announcements if @announcements
    redirect_to :controller => @task_obj.ctrlr_name, :action => 'edit', :id => @task_obj, :anchor => 'announcements'
  end

  def remove_from_announcements
    @task_obj = TaskObj.find(params[:id])
    @announcements = Announcement.find(params[:announcement_id])
    @task_obj.announcements.delete @announcements
    redirect_to :controller => @task_obj.ctrlr_name, :action => 'edit', :id => @task_obj, :anchor => 'announcements'
  end

  def quick_add_announcements
    @task_obj = TaskObj.find(params[:id])
    
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      existing_announcements = @task_obj.announcements.find(:all)
      for str_name in names do
        str_name.strip!
        new_obj = Announcement.find_or_create_by_topic(str_name)
        @task_obj.announcements << new_obj unless existing_announcements.include?(new_obj)
      end
    end
    
    redirect_to :action => 'edit', :id => @task_obj.id
  end


  # -------------------------------------------------

  def add_to_follow_on_tasks
    @ft_subject = "Task"
    @ft_activity = "Select Task".pluralize

    @task_obj = TaskObj.find(params[:id])
    @task_objs = TaskObj.choices_for(@task_obj,'follow_on_tasks')
    @task_objs = @task_objs - [ @task_obj ] 
    @my_follow_on_tasks = @task_obj.follow_on_tasks
    @task_objs.delete_if { |a| @my_follow_on_tasks.include?(a) }
  end
  
  def update_follow_on_tasks
    @task_obj = TaskObj.find(params[:id])
    @follow_on_tasks = [ TaskObj.find(params[:task_obj_ids]) ] if params[:task_obj_ids]
    @task_obj.follow_on_tasks << @follow_on_tasks if @follow_on_tasks
    redirect_to :controller => @task_obj.ctrlr_name, :action => 'edit', :id => @task_obj, :anchor => 'follow_on_tasks'
  end

  def remove_from_follow_on_tasks
    @task_obj = TaskObj.find(params[:id])
    @follow_on_tasks = TaskObj.find(params[:task_obj_id])
    @task_obj.follow_on_tasks.delete @follow_on_tasks
    redirect_to :controller => @task_obj.ctrlr_name, :action => 'edit', :id => @task_obj, :anchor => 'follow_on_tasks'
  end

  def quick_add_follow_on_tasks
    @task_obj = TaskObj.find(params[:id])
    
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      existing_task_objs = @task_obj.follow_on_tasks.find(:all)
      for str_name in names do
        str_name.strip!
        new_obj = TaskObj.find_or_create_by_name(str_name)
        @task_obj.follow_on_tasks << new_obj unless existing_task_objs.include?(new_obj)
      end
    end
    
    redirect_to :action => 'edit', :id => @task_obj.id
  end


  # -------------------------------------------------

  def add_to_resources
    @ft_subject = "Task"
    @ft_activity = "Select Resource".pluralize

    @task_obj = TaskObj.find(params[:id])
    @resources = Resource.choices_for(@task_obj,'resources')
    @resources = @resources - [ @task_obj ] 
    @my_resources = @task_obj.resources
    @resources.delete_if { |a| @my_resources.include?(a) }
  end
  
  def update_resources
    @task_obj = TaskObj.find(params[:id])
    @resources = [ Resource.find(params[:resource_ids]) ] if params[:resource_ids]
    @task_obj.resources << @resources if @resources
    redirect_to :controller => @task_obj.ctrlr_name, :action => 'edit', :id => @task_obj, :anchor => 'resources'
  end

  def remove_from_resources
    @task_obj = TaskObj.find(params[:id])
    @resources = Resource.find(params[:resource_id])
    @task_obj.resources.delete @resources
    redirect_to :controller => @task_obj.ctrlr_name, :action => 'edit', :id => @task_obj, :anchor => 'resources'
  end

  def quick_add_resources
    @task_obj = TaskObj.find(params[:id])
    
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      existing_resources = @task_obj.resources.find(:all)
      for str_name in names do
        str_name.strip!
        new_obj = Resource.find_or_create_by_name(str_name)
        @task_obj.resources << new_obj unless existing_resources.include?(new_obj)
      end
    end
    
    redirect_to :action => 'edit', :id => @task_obj.id
  end


  # -------------------------------------------------

  def add_to_functions
    @ft_subject = "Task"
    @ft_activity = "Select Website Function".pluralize

    @task_obj = TaskObj.find(params[:id])
    @website_functions = WebsiteFunction.choices_for(@task_obj,'functions')
    @website_functions = @website_functions - [ @task_obj ] 
    @my_functions = @task_obj.functions
    @website_functions.delete_if { |a| @my_functions.include?(a) }
  end
  
  def update_functions
    @task_obj = TaskObj.find(params[:id])
    @functions = [ WebsiteFunction.find(params[:website_function_ids]) ] if params[:website_function_ids]
    @task_obj.functions << @functions if @functions
    redirect_to :controller => @task_obj.ctrlr_name, :action => 'edit', :id => @task_obj, :anchor => 'functions'
  end

  def remove_from_functions
    @task_obj = TaskObj.find(params[:id])
    @functions = WebsiteFunction.find(params[:website_function_id])
    @task_obj.functions.delete @functions
    redirect_to :controller => @task_obj.ctrlr_name, :action => 'edit', :id => @task_obj, :anchor => 'functions'
  end

  def quick_add_functions
    @task_obj = TaskObj.find(params[:id])
    
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      existing_website_functions = @task_obj.functions.find(:all)
      for str_name in names do
        str_name.strip!
        new_obj = WebsiteFunction.find_or_create_by_name(str_name)
        @task_obj.functions << new_obj unless existing_website_functions.include?(new_obj)
      end
    end
    
    redirect_to :action => 'edit', :id => @task_obj.id
  end


  # -------------------------------------------------

  def add_to_month
    @ft_subject = "Task"
    @ft_activity = "Select Month"

    @task_obj = TaskObj.find(params[:id])
    @months = Month.choices_for(@task_obj,'month')
    @months = @months - [ @task_obj ]
    @my_month = @task_obj.month
    @months.delete(@my_month) if @my_month
  end
  
  def update_month
    @task_obj = TaskObj.find(params[:id])
    @my_month = params[:month_id] && params[:month_id] != "" ? Month.find(params[:month_id]) : nil 
    @task_obj.month = @my_month 
    @task_obj.save
    redirect_to :controller => @task_obj.ctrlr_name, :action => 'edit', :id => @task_obj, :anchor => 'month'
  end


  # -------------------------------------------------

  def add_to_meeting
    @ft_subject = "Task"
    @ft_activity = "Select Meeting"

    @task_obj = TaskObj.find(params[:id])
    @meetings = Meeting.choices_for(@task_obj,'meeting')
    @meetings = @meetings - [ @task_obj ]
    @my_meeting = @task_obj.meeting
    @meetings.delete(@my_meeting) if @my_meeting
  end
  
  def update_meeting
    @task_obj = TaskObj.find(params[:id])
    @my_meeting = params[:meeting_id] && params[:meeting_id] != "" ? Meeting.find(params[:meeting_id]) : nil 
    @task_obj.meeting = @my_meeting 
    @task_obj.save
    redirect_to :controller => @task_obj.ctrlr_name, :action => 'edit', :id => @task_obj, :anchor => 'meeting'
  end


  # -------------------------------------------------

  def add_to_predecessor
    @ft_subject = "Task"
    @ft_activity = "Select Task"

    @task_obj = TaskObj.find(params[:id])
    @task_objs = TaskObj.choices_for(@task_obj,'predecessor')
    @task_objs = @task_objs - [ @task_obj ]
    @my_predecessor = @task_obj.predecessor
    @task_objs.delete(@my_predecessor) if @my_predecessor
  end
  
  def update_predecessor
    @task_obj = TaskObj.find(params[:id])
    @my_predecessor = params[:task_obj_id] && params[:task_obj_id] != "" ? TaskObj.find(params[:task_obj_id]) : nil 
    @task_obj.predecessor = @my_predecessor 
    @task_obj.save
    redirect_to :controller => @task_obj.ctrlr_name, :action => 'edit', :id => @task_obj, :anchor => 'predecessor'
  end


  # -------------------------------------------------

  def add_to_commitee
    @ft_subject = "Task"
    @ft_activity = "Select Committee"

    @task_obj = TaskObj.find(params[:id])
    @committees = Committee.choices_for(@task_obj,'commitee')
    @committees = @committees - [ @task_obj ]
    @my_commitee = @task_obj.commitee
    @committees.delete(@my_commitee) if @my_commitee
  end
  
  def update_commitee
    @task_obj = TaskObj.find(params[:id])
    @my_commitee = params[:committee_id] && params[:committee_id] != "" ? Committee.find(params[:committee_id]) : nil 
    @task_obj.commitee = @my_commitee 
    @task_obj.save
    redirect_to :controller => @task_obj.ctrlr_name, :action => 'edit', :id => @task_obj, :anchor => 'commitee'
  end


  # -------------------------------------------------

  def add_to_committee_role
    @ft_subject = "Task"
    @ft_activity = "Select Committee Role"

    @task_obj = TaskObj.find(params[:id])
    @committee_roles = CommitteeRole.choices_for(@task_obj,'committee_role')
    @committee_roles = @committee_roles - [ @task_obj ]
    @my_committee_role = @task_obj.committee_role
    @committee_roles.delete(@my_committee_role) if @my_committee_role
  end
  
  def update_committee_role
    @task_obj = TaskObj.find(params[:id])
    @my_committee_role = params[:committee_role_id] && params[:committee_role_id] != "" ? CommitteeRole.find(params[:committee_role_id]) : nil 
    @task_obj.committee_role = @my_committee_role 
    @task_obj.save
    redirect_to :controller => @task_obj.ctrlr_name, :action => 'edit', :id => @task_obj, :anchor => 'committee_role'
  end


  def csv_upload
    # no need to prepare any data - just show the view to post against 'upload_csv'
  end

  def upload_csv

    # commented out - instead try to load the csv without an intermediate file
    #fn = "#{RAILS_ROOT}/uploads/task_obj_data.csv"
    #File.open(fn, "wb") { |f| f.write(params[:csv_file].read) }
    #TaskObj.load_csv_file(fn) if TaskObj.respond_to? :load_csv_file

    TaskObj.load_csv_str(params[:csv_file].read) if TaskObj.respond_to? :load_csv_str
    
    redirect_to :action => 'list' 
  end

  def download_csv
    if params[:field_list].nil? || @user_is_admin
      attr_names = TaskObj.value_attrs
        
      adjacent_objs = [:month,:meeting,:predecessor,:commitee,:committee_role]
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

    all_objs = @task_objs      
    
    if all_objs.size > 0 then
      all_objs.each do |record| 
        csv_string << '"'+attr_names.collect{|s| record.get_attr_val(s,'csv').to_s.gsub("\"","\"\"")}.join('","')+'"' + "\n"
      end
    end
    send_data csv_string, :filename => 'task_obj_data.csv', :type => 'text/csv'
  end 

  # --- 

  def show_queries
    @ft_subject = "TaskObj"
    @ft_activity  = "Reports"

    @queries = TaskObj.query_specs

    render :partial => 'fast_ops/queries', :layout => 'application'
  end

  def run_query
    @def_page_size ||= 50
    @page_size = params[:page_length].to_i > 0 ? params[:page_length].to_i : @def_page_size

    @page_no = [ params[:page].to_i, 1 ].max
    @page_clause = "LIMIT #{@page_size.to_s} OFFSET #{((@page_no-1)*@page_size).to_s}"

    @query = TaskObj.query_specs[params[:query]]
    @sort_fields = params[:order_by] || (! @query[:order_by].to_s.empty? && @query[:order_by].join(",")) || @query[:cols][0]
    @where_clause = params[:where] || (@query[:where].to_s.length > 0 ? @query[:where] : nil)

    @base_sql = @query[:sql] + (@where_clause ? " WHERE #{@where_clause}" : "") 
    @count = TaskObj.count_by_sql("SELECT COUNT(id) FROM (#{@base_sql}) AS row_data")
    
    @sql = @base_sql + (@sort_fields ? " ORDER BY #{@sort_fields}" : "") + (@page_clause ? " #{@page_clause}" : "") 
    @rows = TaskObj.find_by_sql(@sql)

    @cols = @query[:cols] || (@rows.size > 0 && @rows[0].attributes.keys)

    @link_params = { :controller => 'task_objs', :action => 'show' }

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

    @ft_subject  = ( @ft_subject || "Task".pluralize )
    @ft_activity = ( @ft_activity || "All" )

    @order_field = ( params[:order_by] || "seq_no" )
    @direction = ( params[:direction] || "ASC" )

    @query_param = ( params[:query] || "list_all" )
    params[:query] = @query_param
    
    params[:order_by] = quoted_name(@order_field) + " " + @direction

    @where_param = params[:where]  # save the original where param

    adjust_sorting_and_filtering_params(TaskObj,params)
    @order_field = params[:sort_field].to_s unless params[:sort_field].to_s.empty?

    @task_objs = run_query()

    # restore original params passed to the server
    params.clear
    params.merge!(orig_params)
  end

  # --- 

#BEGIN-UID.usermethods

#END-UID.usermethods

end

