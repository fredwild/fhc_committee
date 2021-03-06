class RoleAssignmentsController < ApplicationController

  def index
    prepare_list()
    respond_to do |format|
      format.html {
        render :action => @ft_custom_action and return if @ft_custom_action
        render :action => 'list'
      }
      format.xml  { render :xml => @role_assignments }
    end
  end

  def apply_to_checked_items
    if params[:action_to_perform] == 'Delete'    
        RoleAssignment.destroy(params[:delchk].keys) if params[:delchk] && params[:delchk].keys.size > 0
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
    RoleAssignment.update_all("#{params[:field]} = '#{params[:new_value].strip}'", where_clause)
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
    RoleAssignment.delete_all(where_clause)
    redirect_to :back
  end

  def quick_add_items
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      for str_name in names do
        str_name.strip!
        RoleAssignment.find_or_create_by_name(str_name)
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
      format.xml  { render :xml => @role_assignments }
    end
  end

  def block_list
    prepare_list()
    render :action => @ft_custom_action if @ft_custom_action
  end

  def new
    @new_obj = @role_assignment = RoleAssignment.new

    @ft_subject = "Role Assignment"
    @ft_activity = "New"

    if params && params[:redirect] 
        session[:post_create_redirect] = params[:redirect]
    end

    respond_to do |format|
      format.html { render :action => @ft_custom_action if @ft_custom_action }
      format.xml  { render :xml => @role_assignment }
    end
  end

  def set_context(load_related=true)
    @role_assignment = RoleAssignment.find(params[:id])

    @ft_subject = "Role Assignment"
    @ft_activity = @role_assignment.iname
    
    load_related = false if (params[:action] == "show_properties")    # don't load related items if only showing properties
    return unless load_related

    @order_field = get_order_field(params,'role_assignment','assigned_committees','code')
    @id_set = @role_assignment.send("#{'assigned_committees'.singularize}_ids").concat(["0"]).join(",")
    @assigned_committees = Committee.find_by_sql(%Q~select * from #{Committee.default_query("committee.id in (#{@id_set})")} order by #{quoted_name(@order_field) + " " + (params[:direction] || "asc")}~)

    @event = @role_assignment.event

    @volunteer = @role_assignment.volunteer

    @committee_role = @role_assignment.committee_role

  end

  def show
    set_context()
    respond_to do |format|
      format.html { render :action => @ft_custom_action if @ft_custom_action }
      format.xml  { render :xml => @role_assignment }
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
    if params[:relname].to_s.underscore == 'assigned_committees' then
      render :xml => @role_assignment.assigned_committees.find(:all)
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
    sanitize_params(:role_assignment)
    @new_obj = @role_assignment = RoleAssignment.new(params[:role_assignment])

    if ! ok_to_add_or_update?
        flash[:notice] = 'Not added. ' + @reason.to_s
        @ft_subject = "Role Assignment"
        @ft_activity = "New"
        render :action => 'new'
    else    
      respond_to do |format|
        if @role_assignment.save
          format.xml  { render :xml => @role_assignment, :status => :created, :location => @role_assignment }
          format.html {
            flash[:notice] = "#{@role_assignment.iname} was successfully created."
            redirected_to_aggregator = update_aggregator(@role_assignment,params)
            if ( ! redirected_to_aggregator ) && session[:post_create_redirect]
                url = session[:post_create_redirect] + "?role_assignment_id=" + @role_assignment.id.to_s + "&role_assignment_ids[]=" + @role_assignment.id.to_s 
                redirect_to url
                session[:post_create_redirect] = nil
            else 
                redirect_to :id => @role_assignment.id, :action => (params[:commit].to_s.include?("Another") ? 'new' : 'edit') if ! redirected_to_aggregator 
            end
          }
        else
          format.xml  { render :xml => @role_assignment.errors, :status => :unprocessable_entity }
          format.html {
            flash[:notice] = 'Role Assignment could not be created. See errors.'
            render :action => 'new'
          }
        end
      end
    end
  end

  def update
    @updated_obj = @role_assignment = RoleAssignment.find(params[:id])
    sanitize_params(:role_assignment)

    if ! ok_to_add_or_update?
      flash[:notice] = 'Not updated. ' + @reason.to_s
      @ft_subject = "Role Assignment"
      @ft_activity = "Edit"
      redirect_to :action => 'edit', :id => @role_assignment and return
    end 

      respond_to do |format|
      if @role_assignment.update_attributes(params[:role_assignment])

        if session[:post_update_redirect] then
          redirect_to session[:post_update_redirect]
          session[:post_update_redirect] = nil
          return
        end

        format.xml  { head :ok }
        format.html {
          flash[:notice] = 'Role Assignment was successfully updated.'
          redirect_to :action => 'show', :id => @role_assignment
        }
      else
        format.xml  { render :xml => @role_assignment.errors, :status => :unprocessable_entity }
        format.html { 
          redirect_to :action => 'edit', :id => @role_assignment
        }
      end
    end
  end

  def ok_to_add_or_update?
    if params[:role_assignment][:name].to_s.empty?
      @reason = 'The name field can not be blank.'
      return false
    end
    return true
  end

  def destroy
    @role_assignment = RoleAssignment.find(params[:id])
    @role_assignment.destroy
    respond_to do |format|
      format.html {
        redirect_to :back
      }
      format.xml  { head :ok }
    end
  end


  # -------------------------------------------------

  def add_to_assigned_committees
    @ft_subject = "Role Assignment"
    @ft_activity = "Select Committee".pluralize

    @role_assignment = RoleAssignment.find(params[:id])
    @committees = Committee.choices_for(@role_assignment,'assigned_committees')
    @committees = @committees - [ @role_assignment ] 
    @my_assigned_committees = @role_assignment.assigned_committees
    @committees.delete_if { |a| @my_assigned_committees.include?(a) }
  end
  
  def update_assigned_committees
    @role_assignment = RoleAssignment.find(params[:id])
    @assigned_committees = [ Committee.find(params[:committee_ids]) ] if params[:committee_ids]
    @role_assignment.assigned_committees << @assigned_committees if @assigned_committees
    redirect_to :controller => @role_assignment.ctrlr_name, :action => 'edit', :id => @role_assignment, :anchor => 'assigned_committees'
  end

  def remove_from_assigned_committees
    @role_assignment = RoleAssignment.find(params[:id])
    @assigned_committees = Committee.find(params[:committee_id])
    @role_assignment.assigned_committees.delete @assigned_committees
    redirect_to :controller => @role_assignment.ctrlr_name, :action => 'edit', :id => @role_assignment, :anchor => 'assigned_committees'
  end

  def quick_add_assigned_committees
    @role_assignment = RoleAssignment.find(params[:id])
    
    str_names = params[:names].strip
    if str_names.length > 0 then
      names = str_names.split("\n")
      existing_committees = @role_assignment.assigned_committees.find(:all)
      for str_name in names do
        str_name.strip!
        new_obj = Committee.find_or_create_by_code(str_name)
        @role_assignment.assigned_committees << new_obj unless existing_committees.include?(new_obj)
      end
    end
    
    redirect_to :action => 'edit', :id => @role_assignment.id
  end


  # -------------------------------------------------

  def add_to_event
    @ft_subject = "Role Assignment"
    @ft_activity = "Select Event"

    @role_assignment = RoleAssignment.find(params[:id])
    @events = Event.choices_for(@role_assignment,'event')
    @events = @events - [ @role_assignment ]
    @my_event = @role_assignment.event
    @events.delete(@my_event) if @my_event
  end
  
  def update_event
    @role_assignment = RoleAssignment.find(params[:id])
    @my_event = params[:event_id] && params[:event_id] != "" ? Event.find(params[:event_id]) : nil 
    @role_assignment.event = @my_event 
    @role_assignment.save
    redirect_to :controller => @role_assignment.ctrlr_name, :action => 'edit', :id => @role_assignment, :anchor => 'event'
  end


  # -------------------------------------------------

  def add_to_volunteer
    @ft_subject = "Role Assignment"
    @ft_activity = "Select Volunteer"

    @role_assignment = RoleAssignment.find(params[:id])
    @volunteers = Volunteer.choices_for(@role_assignment,'volunteer')
    @volunteers = @volunteers - [ @role_assignment ]
    @my_volunteer = @role_assignment.volunteer
    @volunteers.delete(@my_volunteer) if @my_volunteer
  end
  
  def update_volunteer
    @role_assignment = RoleAssignment.find(params[:id])
    @my_volunteer = params[:volunteer_id] && params[:volunteer_id] != "" ? Volunteer.find(params[:volunteer_id]) : nil 
    @role_assignment.volunteer = @my_volunteer 
    @role_assignment.save
    redirect_to :controller => @role_assignment.ctrlr_name, :action => 'edit', :id => @role_assignment, :anchor => 'volunteer'
  end


  # -------------------------------------------------

  def add_to_committee_role
    @ft_subject = "Role Assignment"
    @ft_activity = "Select Committee Role"

    @role_assignment = RoleAssignment.find(params[:id])
    @committee_roles = CommitteeRole.choices_for(@role_assignment,'committee_role')
    @committee_roles = @committee_roles - [ @role_assignment ]
    @my_committee_role = @role_assignment.committee_role
    @committee_roles.delete(@my_committee_role) if @my_committee_role
  end
  
  def update_committee_role
    @role_assignment = RoleAssignment.find(params[:id])
    @my_committee_role = params[:committee_role_id] && params[:committee_role_id] != "" ? CommitteeRole.find(params[:committee_role_id]) : nil 
    @role_assignment.committee_role = @my_committee_role 
    @role_assignment.save
    redirect_to :controller => @role_assignment.ctrlr_name, :action => 'edit', :id => @role_assignment, :anchor => 'committee_role'
  end


  def csv_upload
    # no need to prepare any data - just show the view to post against 'upload_csv'
  end

  def upload_csv

    # commented out - instead try to load the csv without an intermediate file
    #fn = "#{RAILS_ROOT}/uploads/role_assignment_data.csv"
    #File.open(fn, "wb") { |f| f.write(params[:csv_file].read) }
    #RoleAssignment.load_csv_file(fn) if RoleAssignment.respond_to? :load_csv_file

    RoleAssignment.load_csv_str(params[:csv_file].read) if RoleAssignment.respond_to? :load_csv_str
    
    redirect_to :action => 'list' 
  end

  def download_csv
    if params[:field_list].nil? || @user_is_admin
      attr_names = RoleAssignment.value_attrs
        
      adjacent_objs = [:event,:volunteer,:committee_role]
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

    all_objs = @role_assignments      
    
    if all_objs.size > 0 then
      all_objs.each do |record| 
        csv_string << '"'+attr_names.collect{|s| record.get_attr_val(s,'csv').to_s.gsub("\"","\"\"")}.join('","')+'"' + "\n"
      end
    end
    send_data csv_string, :filename => 'role_assignment_data.csv', :type => 'text/csv'
  end 

  # --- 

  def show_queries
    @ft_subject = "RoleAssignment"
    @ft_activity  = "Reports"

    @queries = RoleAssignment.query_specs

    render :partial => 'fast_ops/queries', :layout => 'application'
  end

  def run_query
    @def_page_size ||= 50
    @page_size = params[:page_length].to_i > 0 ? params[:page_length].to_i : @def_page_size

    @page_no = [ params[:page].to_i, 1 ].max
    @page_clause = "LIMIT #{@page_size.to_s} OFFSET #{((@page_no-1)*@page_size).to_s}"

    @query = RoleAssignment.query_specs[params[:query]]
    @sort_fields = params[:order_by] || (! @query[:order_by].to_s.empty? && @query[:order_by].join(",")) || @query[:cols][0]
    @where_clause = params[:where] || (@query[:where].to_s.length > 0 ? @query[:where] : nil)

    @base_sql = @query[:sql] + (@where_clause ? " WHERE #{@where_clause}" : "") 
    @count = RoleAssignment.count_by_sql("SELECT COUNT(id) FROM (#{@base_sql}) AS row_data")
    
    @sql = @base_sql + (@sort_fields ? " ORDER BY #{@sort_fields}" : "") + (@page_clause ? " #{@page_clause}" : "") 
    @rows = RoleAssignment.find_by_sql(@sql)

    @cols = @query[:cols] || (@rows.size > 0 && @rows[0].attributes.keys)

    @link_params = { :controller => 'role_assignments', :action => 'show' }

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

    @ft_subject  = ( @ft_subject || "Role Assignment".pluralize )
    @ft_activity = ( @ft_activity || "All" )

    @order_field = ( params[:order_by] || "name" )
    @direction = ( params[:direction] || "ASC" )

    @query_param = ( params[:query] || "list_all" )
    params[:query] = @query_param
    
    params[:order_by] = quoted_name(@order_field) + " " + @direction

    @where_param = params[:where]  # save the original where param

    adjust_sorting_and_filtering_params(RoleAssignment,params)
    @order_field = params[:sort_field].to_s unless params[:sort_field].to_s.empty?

    @role_assignments = run_query()

    # restore original params passed to the server
    params.clear
    params.merge!(orig_params)
  end

  # --- 

#BEGIN-UID.usermethods


  def iff_nil(obj,ref,default="")
    return obj ? obj.send(ref.to_s) : default
  end

  after_filter :fix_name2, :only => [ :create, :update ]
  def fix_name2
    @role_assignment.name = iff_nil(@role_assignment.committee_role,:iname) + ": " +
                            iff_nil(@role_assignment.volunteer,:sname)      + " (" +
                            iff_nil(@role_assignment.event,:iname) + ")"
    @role_assignment.save()
  end

  before_filter :default_list_args, :only => [ :list ]
  def default_list_args
    if params[:search_field].to_s.empty? then
       redirect_to :controller => 'role_assignments', :action => 'list', :search_field => 'event', :search_str => '2014'
       return false
    end
  end

  def ok_to_add_or_update?
     return true
  end

#END-UID.usermethods

end

