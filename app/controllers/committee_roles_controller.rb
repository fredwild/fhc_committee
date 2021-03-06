class CommitteeRolesController < ApplicationController

  def index
    prepare_list()
    respond_to do |format|
      format.html {
        render :action => @ft_custom_action and return if @ft_custom_action
        render :action => 'list'
      }
      format.xml  { render :xml => @committee_roles }
    end
  end

  def apply_to_checked_items
    if params[:action_to_perform] == 'Delete'    
        CommitteeRole.destroy(params[:delchk].keys) if params[:delchk] && params[:delchk].keys.size > 0
    end 

    redirect_to :back
  end

  def apply_seq_edits
    case request.method
      when :post
        CommitteeRole.reassign_seq_nos(params[:seq_nos])
        redirect_to :back
      when :get
        @committee_roles = CommitteeRole.find(:all, :order => 'seq_no')
    end
  end

  def swap_seq_nos
    obj1 = CommitteeRole.find(params[:obj1_id])
    obj2 = CommitteeRole.find(params[:obj2_id])

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
    CommitteeRole.update_all("#{params[:field]} = '#{params[:new_value].strip}'", where_clause)
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
    CommitteeRole.delete_all(where_clause)
    redirect_to :back
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
      format.xml  { render :xml => @committee_roles }
    end
  end

  def block_list
    prepare_list()
    render :action => @ft_custom_action if @ft_custom_action
  end

  def new
    @new_obj = @committee_role = CommitteeRole.new

    @ft_subject = "Committee Role"
    @ft_activity = "New"

    if params && params[:redirect] 
        session[:post_create_redirect] = params[:redirect]
    end

    @committee = Committee.find(params[:committee_id]) if params[:committee_id]
    @new_obj.committee = @committee
    respond_to do |format|
      format.html { render :action => @ft_custom_action if @ft_custom_action }
      format.xml  { render :xml => @committee_role }
    end
  end

  def set_context(load_related=true)
    @committee_role = CommitteeRole.find(params[:id])

    @ft_subject = "Committee Role"
    @ft_activity = @committee_role.iname
    
    load_related = false if (params[:action] == "show_properties")    # don't load related items if only showing properties
    return unless load_related

    @order_field = get_order_field(params,'committee_role','meetings','name')
    @id_set = @committee_role.send("#{'meetings'.singularize}_ids").concat(["0"]).join(",")
    @meetings = Meeting.find_by_sql(%Q~select * from #{Meeting.default_query("meeting.id in (#{@id_set})")} order by #{quoted_name(@order_field) + " " + (params[:direction] || "asc")}~)

    @order_field = get_order_field(params,'committee_role','tasks','name')
    @id_set = @committee_role.send("#{'tasks'.singularize}_ids").concat(["0"]).join(",")
    @tasks = TaskObj.find_by_sql(%Q~select * from #{TaskObj.default_query("task_obj.id in (#{@id_set})")} order by #{quoted_name(@order_field) + " " + (params[:direction] || "asc")}~)

    @order_field = get_order_field(params,'committee_role','assignments','name')
    @id_set = @committee_role.send("#{'assignments'.singularize}_ids").concat(["0"]).join(",")
    @assignments = RoleAssignment.find_by_sql(%Q~select * from #{RoleAssignment.default_query("role_assignment.id in (#{@id_set})")} order by #{quoted_name(@order_field) + " " + (params[:direction] || "asc")}~)

    @order_field = get_order_field(params,'committee_role','meetings','name')
    @id_set = @committee_role.send("#{'meetings'.singularize}_ids").concat(["0"]).join(",")
    @meetings = Meeting.find_by_sql(%Q~select * from #{Meeting.default_query("meeting.id in (#{@id_set})")} order by #{quoted_name(@order_field) + " " + (params[:direction] || "asc")}~)

    @committee = @committee_role.committee

  end

  def show
    set_context()
    respond_to do |format|
      format.html { render :action => @ft_custom_action if @ft_custom_action }
      format.xml  { render :xml => @committee_role }
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
    if params[:relname].to_s.underscore == 'meetings' then
      render :xml => @committee_role.meetings.find(:all)
      return
    end
    if params[:relname].to_s.underscore == 'tasks' then
      render :xml => @committee_role.tasks.find(:all)
      return
    end
    if params[:relname].to_s.underscore == 'assignments' then
      render :xml => @committee_role.assignments.find(:all)
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
    @committee = Committee.find(params[:committee_id]) if params[:committee_id] && params[:committee_id].length > 0
    if @committee 
      @committee.committee_roles << new_obj
      unless session[:post_create_redirect]
        if ! params[:commit].to_s.include?("Another")
          redirect_to :controller => @committee.ctrlr_name, :action => 'edit', :id => @committee.id, :anchor => "committee_roles"
        else
          redirect_to :action => 'new', :params => { :committee_id => @committee.id }
        end
        return true
      end
    end
    return false
  end

  def sanitize_params(hk)
    params[hk].each{|k,v| params[hk][k] = v.gsub("-- select --","")}  if params[hk]
    params[hk].each{|k,v| params[hk][k] = v.gsub(/HH:MM.*/,"")}       if params[hk]
  end

  def create
    sanitize_params(:committee_role)
    @new_obj = @committee_role = CommitteeRole.new(params[:committee_role])

    if ! ok_to_add_or_update?
        flash[:notice] = 'Not added. ' + @reason.to_s
        @ft_subject = "Committee Role"
        @ft_activity = "New"
        @committee = Committee.find(params[:committee_id]) if params[:committee_id] && Committee.exists?(params[:committee_id])
        render :action => 'new'
    else    
      respond_to do |format|
        if @committee_role.save
          format.xml  { render :xml => @committee_role, :status => :created, :location => @committee_role }
          format.html {
            flash[:notice] = "#{@committee_role.iname} was successfully created."
            redirected_to_aggregator = update_aggregator(@committee_role,params)
            if ( ! redirected_to_aggregator ) && session[:post_create_redirect]
                url = session[:post_create_redirect] + "?committee_role_id=" + @committee_role.id.to_s + "&committee_role_ids[]=" + @committee_role.id.to_s 
                redirect_to url
                session[:post_create_redirect] = nil
            else 
                redirect_to :id => @committee_role.id, :action => (params[:commit].to_s.include?("Another") ? 'new' : 'edit') if ! redirected_to_aggregator 
            end
          }

            if params[:committee_role][:seq_no].to_s.empty? then
              @committee_role.seq_no = @committee_role.id
              @committee_role.save()
            end
        else
          format.xml  { render :xml => @committee_role.errors, :status => :unprocessable_entity }
          format.html {
            flash[:notice] = 'Committee Role could not be created. See errors.'
            @committee = Committee.find(params[:committee_id]) if params[:committee_id] && Committee.exists?(params[:committee_id])
            render :action => 'new'
          }
        end
      end
    end
  end

  def update
    @updated_obj = @committee_role = CommitteeRole.find(params[:id])
    sanitize_params(:committee_role)

    if ! ok_to_add_or_update?
      flash[:notice] = 'Not updated. ' + @reason.to_s
      @ft_subject = "Committee Role"
      @ft_activity = "Edit"
      redirect_to :action => 'edit', :id => @committee_role and return
    end 

      respond_to do |format|
      if @committee_role.update_attributes(params[:committee_role])

        if session[:post_update_redirect] then
          redirect_to session[:post_update_redirect]
          session[:post_update_redirect] = nil
          return
        end

        format.xml  { head :ok }
        format.html {
          flash[:notice] = 'Committee Role was successfully updated.'
          redirect_to :action => 'show', :id => @committee_role
        }
      else
        format.xml  { render :xml => @committee_role.errors, :status => :unprocessable_entity }
        format.html { 
          redirect_to :action => 'edit', :id => @committee_role
        }
      end
    end
  end

  def ok_to_add_or_update?
    if params[:committee_role][:role_name].to_s.empty?
      @reason = 'The role_name field can not be blank.'
      return false
    end
    return true
  end

  def destroy
    @committee_role = CommitteeRole.find(params[:id])
    @committee_role.destroy
    respond_to do |format|
      format.html {
        redirect_to :back
      }
      format.xml  { head :ok }
    end
  end


  # -------------------------------------------------

  def add_to_meetings
    @ft_subject = "Committee Role"
    @ft_activity = "Select Meeting".pluralize

    @committee_role = CommitteeRole.find(params[:id])
    @meetings = Meeting.choices_for(@committee_role,'meetings')
    @meetings = @meetings - [ @committee_role ] 
    @my_meetings = @committee_role.meetings
    @meetings.delete_if { |a| @my_meetings.include?(a) }
  end
  
  def update_meetings
    @committee_role = CommitteeRole.find(params[:id])
    @meetings = [ Meeting.find(params[:meeting_ids]) ] if params[:meeting_ids]
    @committee_role.meetings << @meetings if @meetings
    redirect_to :controller => @committee_role.ctrlr_name, :action => 'edit', :id => @committee_role, :anchor => 'meetings'
  end

  def remove_from_meetings
    @committee_role = CommitteeRole.find(params[:id])
    @meetings = Meeting.find(params[:meeting_id])
    @committee_role.meetings.delete @meetings
    redirect_to :controller => @committee_role.ctrlr_name, :action => 'edit', :id => @committee_role, :anchor => 'meetings'
  end

  def quick_add_meetings
    @committee_role = CommitteeRole.find(params[:id])
    
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      existing_meetings = @committee_role.meetings.find(:all)
      for str_name in names do
        str_name.strip!
        new_obj = Meeting.find_or_create_by_name(str_name)
        @committee_role.meetings << new_obj unless existing_meetings.include?(new_obj)
      end
    end
    
    redirect_to :action => 'edit', :id => @committee_role.id
  end


  # -------------------------------------------------

  def add_to_tasks
    @ft_subject = "Committee Role"
    @ft_activity = "Select Task".pluralize

    @committee_role = CommitteeRole.find(params[:id])
    @task_objs = TaskObj.choices_for(@committee_role,'tasks')
    @task_objs = @task_objs - [ @committee_role ] 
    @my_tasks = @committee_role.tasks
    @task_objs.delete_if { |a| @my_tasks.include?(a) }
  end
  
  def update_tasks
    @committee_role = CommitteeRole.find(params[:id])
    @tasks = [ TaskObj.find(params[:task_obj_ids]) ] if params[:task_obj_ids]
    @committee_role.tasks << @tasks if @tasks
    redirect_to :controller => @committee_role.ctrlr_name, :action => 'edit', :id => @committee_role, :anchor => 'tasks'
  end

  def remove_from_tasks
    @committee_role = CommitteeRole.find(params[:id])
    @tasks = TaskObj.find(params[:task_obj_id])
    @committee_role.tasks.delete @tasks
    redirect_to :controller => @committee_role.ctrlr_name, :action => 'edit', :id => @committee_role, :anchor => 'tasks'
  end

  def quick_add_tasks
    @committee_role = CommitteeRole.find(params[:id])
    
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      existing_task_objs = @committee_role.tasks.find(:all)
      for str_name in names do
        str_name.strip!
        new_obj = TaskObj.find_or_create_by_name(str_name)
        @committee_role.tasks << new_obj unless existing_task_objs.include?(new_obj)
      end
    end
    
    redirect_to :action => 'edit', :id => @committee_role.id
  end


  # -------------------------------------------------

  def add_to_assignments
    @ft_subject = "Committee Role"
    @ft_activity = "Select Role Assignment".pluralize

    @committee_role = CommitteeRole.find(params[:id])
    @role_assignments = RoleAssignment.choices_for(@committee_role,'assignments')
    @role_assignments = @role_assignments - [ @committee_role ] 
    @my_assignments = @committee_role.assignments
    @role_assignments.delete_if { |a| @my_assignments.include?(a) }
  end
  
  def update_assignments
    @committee_role = CommitteeRole.find(params[:id])
    @assignments = [ RoleAssignment.find(params[:role_assignment_ids]) ] if params[:role_assignment_ids]
    @committee_role.assignments << @assignments if @assignments
    redirect_to :controller => @committee_role.ctrlr_name, :action => 'edit', :id => @committee_role, :anchor => 'assignments'
  end

  def remove_from_assignments
    @committee_role = CommitteeRole.find(params[:id])
    @assignments = RoleAssignment.find(params[:role_assignment_id])
    @committee_role.assignments.delete @assignments
    redirect_to :controller => @committee_role.ctrlr_name, :action => 'edit', :id => @committee_role, :anchor => 'assignments'
  end

  def quick_add_assignments
    @committee_role = CommitteeRole.find(params[:id])
    
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      existing_role_assignments = @committee_role.assignments.find(:all)
      for str_name in names do
        str_name.strip!
        new_obj = RoleAssignment.find_or_create_by_name(str_name)
        @committee_role.assignments << new_obj unless existing_role_assignments.include?(new_obj)
      end
    end
    
    redirect_to :action => 'edit', :id => @committee_role.id
  end


  # -------------------------------------------------

  def add_to_meetings
    @ft_subject = "Committee Role"
    @ft_activity = "Select Meeting".pluralize

    @committee_role = CommitteeRole.find(params[:id])
    @meetings = Meeting.choices_for(@committee_role,'meetings')
    @meetings = @meetings - [ @committee_role ]
    @my_meetings = @committee_role.meetings
    @meetings.delete_if{|a| @my_meetings.include?(a)}
  end
  
  def update_meetings
    @committee_role = CommitteeRole.find(params[:id])
    @meetings = [ Meeting.find(params[:meeting_ids]) ] if params[:meeting_ids]
    @committee_role.meetings << @meetings if @meetings
    redirect_to :controller => @committee_role.ctrlr_name, :action => 'edit', :id => @committee_role, :anchor => 'meetings'
  end

  def remove_from_meetings
    @committee_role = CommitteeRole.find(params[:id])
    @meetings = Meeting.find(params[:meeting_id])
    @committee_role.meetings.delete @meetings
    redirect_to :controller => @committee_role.ctrlr_name, :action => 'edit', :id => @committee_role, :anchor => 'meetings'
  end

  def quick_add_meetings
    @committee_role = CommitteeRole.find(params[:id])
    
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      existing_meetings = @committee_role.meetings.find(:all)
      for str_name in names do
        str_name.strip!
        new_obj = Meeting.find_or_create_by_name(str_name)
        @committee_role.meetings << new_obj unless existing_meetings.include?(new_obj)
      end
    end
    
    redirect_to :action => 'edit', :id => @committee_role.id
  end


  def csv_upload
    # no need to prepare any data - just show the view to post against 'upload_csv'
  end

  def upload_csv

    # commented out - instead try to load the csv without an intermediate file
    #fn = "#{RAILS_ROOT}/uploads/committee_role_data.csv"
    #File.open(fn, "wb") { |f| f.write(params[:csv_file].read) }
    #CommitteeRole.load_csv_file(fn) if CommitteeRole.respond_to? :load_csv_file

    CommitteeRole.load_csv_str(params[:csv_file].read) if CommitteeRole.respond_to? :load_csv_str
    
    redirect_to :action => 'list' 
  end

  def download_csv
    if params[:field_list].nil? || @user_is_admin
      attr_names = CommitteeRole.value_attrs
        
      adjacent_objs = [:committee]
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

    all_objs = @committee_roles      
    
    if all_objs.size > 0 then
      all_objs.each do |record| 
        csv_string << '"'+attr_names.collect{|s| record.get_attr_val(s,'csv').to_s.gsub("\"","\"\"")}.join('","')+'"' + "\n"
      end
    end
    send_data csv_string, :filename => 'committee_role_data.csv', :type => 'text/csv'
  end 

  # --- 

  def show_queries
    @ft_subject = "CommitteeRole"
    @ft_activity  = "Reports"

    @queries = CommitteeRole.query_specs

    render :partial => 'fast_ops/queries', :layout => 'application'
  end

  def run_query
    @def_page_size ||= 50
    @page_size = params[:page_length].to_i > 0 ? params[:page_length].to_i : @def_page_size

    @page_no = [ params[:page].to_i, 1 ].max
    @page_clause = "LIMIT #{@page_size.to_s} OFFSET #{((@page_no-1)*@page_size).to_s}"

    @query = CommitteeRole.query_specs[params[:query]]
    @sort_fields = params[:order_by] || (! @query[:order_by].to_s.empty? && @query[:order_by].join(",")) || @query[:cols][0]
    @where_clause = params[:where] || (@query[:where].to_s.length > 0 ? @query[:where] : nil)

    @base_sql = @query[:sql] + (@where_clause ? " WHERE #{@where_clause}" : "") 
    @count = CommitteeRole.count_by_sql("SELECT COUNT(id) FROM (#{@base_sql}) AS row_data")
    
    @sql = @base_sql + (@sort_fields ? " ORDER BY #{@sort_fields}" : "") + (@page_clause ? " #{@page_clause}" : "") 
    @rows = CommitteeRole.find_by_sql(@sql)

    @cols = @query[:cols] || (@rows.size > 0 && @rows[0].attributes.keys)

    @link_params = { :controller => 'committee_roles', :action => 'show' }

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

    @ft_subject  = ( @ft_subject || "Committee Role".pluralize )
    @ft_activity = ( @ft_activity || "All" )

    @order_field = ( params[:order_by] || "seq_no" )
    @direction = ( params[:direction] || "ASC" )

    @query_param = ( params[:query] || "list_all" )
    params[:query] = @query_param
    
    params[:order_by] = quoted_name(@order_field) + " " + @direction

    @where_param = params[:where]  # save the original where param

    adjust_sorting_and_filtering_params(CommitteeRole,params)
    @order_field = params[:sort_field].to_s unless params[:sort_field].to_s.empty?

    @committee_roles = run_query()

    # restore original params passed to the server
    params.clear
    params.merge!(orig_params)
  end

  # --- 

#BEGIN-UID.usermethods

  def set_context(load_related=true)
    @committee_role = CommitteeRole.find(params[:id])

    @ft_subject = "Committee Role"
    @ft_activity = @committee_role.iname

    load_related = false if (params[:action] == "show_properties")    # don't load related items if only showing properties
    return unless load_related

    @order_field = get_order_field(params,'committee_role','meetings','name')
    @id_set = @committee_role.send("#{'meetings'.singularize}_ids").concat(["0"]).join(",")
    @meetings = Meeting.find_by_sql(%Q~select * from #{Meeting.default_query("meeting.id in (#{@id_set})")} order by #{quoted_name(@order_field) + " " + (params[:direction] || "asc")}~)

    @order_field = 'timeframe' # get_order_field(params,'committee_role','tasks','name')
    @id_set = @committee_role.send("#{'tasks'.singularize}_ids").concat(["0"]).join(",")
    @tasks = TaskObj.find_by_sql(%Q~select * from #{TaskObj.default_query("task_obj.id in (#{@id_set})")} order by #{quoted_name(@order_field) + " " + (params[:direction] || "asc")}~)

    @order_field = get_order_field(params,'committee_role','assignments','name')
    @id_set = @committee_role.send("#{'assignments'.singularize}_ids").concat(["0"]).join(",")
    @assignments = RoleAssignment.find_by_sql(%Q~select * from #{RoleAssignment.default_query("role_assignment.id in (#{@id_set})")} order by #{quoted_name(@order_field) + " " + (params[:direction] || "asc")}~)

    @order_field = get_order_field(params,'committee_role','meetings','name')
    @id_set = @committee_role.send("#{'meetings'.singularize}_ids").concat(["0"]).join(",")
    @meetings = Meeting.find_by_sql(%Q~select * from #{Meeting.default_query("meeting.id in (#{@id_set})")} order by #{quoted_name(@order_field) + " " + (params[:direction] || "asc")}~)

    @committee = @committee_role.committee

  end

#END-UID.usermethods

end

