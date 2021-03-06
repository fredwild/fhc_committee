
require 'csv'
require 'ft_modules'

class TaskObj < ActiveRecord::Base

   include FtUtils

   set_table_name 'task_objs'

   has_many             :announcements, :class_name => "Announcement", :foreign_key => "task_task_obj_id"
   has_many             :follow_on_tasks, :class_name => "TaskObj", :foreign_key => "predecessor_task_obj_id"
   has_many             :functions, :class_name => "WebsiteFunction", :foreign_key => "task_task_obj_id"
   has_and_belongs_to_many :documents, :class_name => "Document", :join_table => "task_objs_documents_documents", :foreign_key => "task_obj_src_id", :association_foreign_key => "document_dest_id"

   has_and_belongs_to_many :resources, :class_name => "Resource", :join_table => "task_objs_resources_resources", :foreign_key => "task_obj_src_id", :association_foreign_key => "resource_dest_id"

   belongs_to           :month, :class_name => "Month", :foreign_key => "month_month_id"
   belongs_to           :meeting, :class_name => "Meeting", :foreign_key => "meeting_meeting_id"
   belongs_to           :predecessor, :class_name => "TaskObj", :foreign_key => "predecessor_task_obj_id"
   belongs_to           :commitee, :class_name => "Committee", :foreign_key => "commitee_committee_id"
   belongs_to           :committee_role, :class_name => "CommitteeRole", :foreign_key => "committee_role_committee_role_id"


   def after_initialize()
     begin
     rescue
     end
   end

   def display_name
      return "Task"
   end

   def self.display_name
      return "Task"
   end

   def ctrlr_name
      return "task_objs"
   end

   def self.iattr_name
      return "name"
   end

   def iattr_name
      return "name"
   end

   def iname
      return "" if self.name.nil? 
      return self.name.to_s
   end

   def qname
      q_name = iname()
      return q_name
   end

   def sname
       return self.qname
   end

   def container_qname
      return ""
   end

   def container_obj
      return nil 
   end

   def get_children
      # override this method to return this object's sub-items - used in "tree_for" helper

      # return [ { :title => "Title", :items => [ item, item, ... ] }, ... ] to allow the tree to show multiple titled lists of sub-items
      # return [ item, item, ... ] to allow the tree to show a simple indented list of sub-items without a title

      sub_items = [ ]
      return sub_items
   end



    # runtime metadata support methods

    def self.attr_type_info(attr_name=nil)
        unless defined?(@@attr_info)
          @@attr_info = {}
          @@attr_info['name'] = { :datatype => 'string', :modifier => '', :length => 60, :is_identity_attr => true, :default => '', :mode => 'rw' }
          @@attr_info['description'] = { :datatype => 'text', :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['month_week'] = { :datatype => 'int'.downcase, :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['key_task'] = { :datatype => 'boolean'.downcase, :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['seq_no'] = { :datatype => 'int'.downcase, :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
        end
        return attr_name.nil? ? @@attr_info : @@attr_info[attr_name.to_s]
    end

    def self.attr_lengths
      { 'name' => 60 }
    end

    def self.value_attrs
      ["name","description","month_week","key_task","seq_no"]
    end

    def self.foreign_key_attrs
       ["month","meeting","predecessor","commitee","committee_role"]
    end

    def self.filter_attrs(attrs)
      valid_keys = self.value_attrs + self.foreign_key_attrs.collect{|fka| foreign_key_attr_info(fka)[:foreign_key]}
      return attrs.reject{|k,v| ! valid_keys.include?(k.to_s)}
    end

    def self.foreign_key_attr_info(fk_attr_name=nil)
      unless defined?(@@fk_attr_info)
        @@fk_attr_info = { }
        @@fk_attr_info['month'] = {:datatype => "Month", :foreign_key => "month_month_id"}
        @@fk_attr_info['meeting'] = {:datatype => "Meeting", :foreign_key => "meeting_meeting_id"}
        @@fk_attr_info['predecessor'] = {:datatype => "TaskObj", :foreign_key => "predecessor_task_obj_id"}
        @@fk_attr_info['commitee'] = {:datatype => "Committee", :foreign_key => "commitee_committee_id"}
        @@fk_attr_info['committee_role'] = {:datatype => "CommitteeRole", :foreign_key => "committee_role_committee_role_id"}
      end

      return fk_attr_name.nil? ? @@fk_attr_info : @@fk_attr_info[fk_attr_name.to_s]
    end

    def self.get_form_fields()
       ["name","description","month_week","key_task","seq_no"]
    end

    def self.csv_header_row
      (value_attrs + foreign_key_attrs + []).join(",")
    end

    def self.load_csv_file(filename)
        self.load_csv_str(File.read(filename))
    end

    def self.load_csv_str(csv_str)
        rows = load_csv_data(csv_str)
        update_table_entries(rows)
    end

    def self.load_csv_data(csv_str)
        headers = Array.new
        rows = Array.new
        row_no = 1

        cname = String.new
        cval = String.new

        records = CSV.parse(csv_str) || []

        records.each do |row|
            if row
                if row_no == 1
                    headers = row.collect{|v| v.to_s.strip.gsub(/\s+/,"").underscore}
                else
                    row_data = Hash.new("")
                    col_no = 0
                    row.each { |val|
                      if ! headers[col_no].to_s.empty?
                        cname = headers[col_no]
                        cval = val.to_s.gsub("\"","").strip

                        limit = attr_lengths[cname]
                        cval = cval[0...limit] if limit

                        begin
                          row_data[cname.to_sym] = cval.gsub(/[\x80-\xff]/,'')
                        rescue
                        end
                      end
                      col_no = col_no + 1
                    }
                    rows << row_data
                end

                row_no = row_no + 1
            end
        end

        return rows 
    end

    def self.update_table_entries(rows)
      rows.each { |row|
        unless row[:name].to_s.empty? then
          obj = find_or_create_by_name(row[:name])

          attrs = row.clone
          attrs.delete_if { |k,v| (! self.value_attrs.member? k.to_s) || v.size == 0 }
          obj.attributes = attrs

          obj.month = Month.find_or_create_by_seq_no(row[:month]) unless row[:month].to_s.empty?
          obj.meeting = Meeting.find_or_create_by_name(row[:meeting]) unless row[:meeting].to_s.empty?
          obj.predecessor = TaskObj.find_or_create_by_name(row[:predecessor]) unless row[:predecessor].to_s.empty?
          obj.commitee = Committee.find_or_create_by_code(row[:commitee]) unless row[:commitee].to_s.empty?
          obj.committee_role = CommitteeRole.find_or_create_by_role_name(row[:committee_role]) unless row[:committee_role].to_s.empty?

          obj.save()
        end # if identity attr supplied
      }
    end

 public


  # returns the next/prev item given its context of ownership: a) global or b) as a contained item of another object

  def next_item
    item = TaskObj.find(:first, :order => FtUtils.quoted_name('name'), :conditions => ["name > ? ", self.name] )
    item = TaskObj.find(:first, :order => FtUtils.quoted_name('name')) if item.nil? 
    return item
  end

  def prev_item
    item = TaskObj.find(:first, :order => FtUtils.quoted_name('name') + ' DESC', :conditions => ["name < ? ", self.name] )
    item = TaskObj.find(:first, :order => FtUtils.quoted_name('name') + ' DESC') if item.nil? 
    return item
  end

  def self.items_for_index
    return TaskObj.find(:all, :order => 'name')
  end

  # ---

  def self.default_query(cond=nil)

    return <<-EOS
          (SELECT task_obj.name as #{FtUtils.quoted_name('name')},
              task_obj.description as #{FtUtils.quoted_name('description')},
              task_obj.month_week as #{FtUtils.quoted_name('month_week')},
              task_obj.key_task as #{FtUtils.quoted_name('key_task')},
              task_obj.seq_no as #{FtUtils.quoted_name('seq_no')},
              month.seq_no as #{FtUtils.quoted_name('month')},
              month.id as month_month_id,
              meeting.name as #{FtUtils.quoted_name('meeting')},
              meeting.id as meeting_meeting_id,
              predecessor.name as #{FtUtils.quoted_name('predecessor')},
              predecessor.id as predecessor_task_obj_id,
              commitee.code as #{FtUtils.quoted_name('commitee')},
              commitee.id as commitee_committee_id,
              committee_role.role_name as #{FtUtils.quoted_name('committee_role')},
              committee_role.id as committee_role_committee_role_id,
              task_obj.id as id
          FROM
              #{FtUtils.quoted_name('task_objs')} AS #{FtUtils.quoted_name('task_obj')}
              left outer join #{FtUtils.quoted_name('months')} as #{FtUtils.quoted_name('month')} on task_obj.month_month_id = month.id
              left outer join #{FtUtils.quoted_name('meetings')} as #{FtUtils.quoted_name('meeting')} on task_obj.meeting_meeting_id = meeting.id
              left outer join #{FtUtils.quoted_name('task_objs')} as #{FtUtils.quoted_name('predecessor')} on task_obj.predecessor_task_obj_id = predecessor.id
              left outer join #{FtUtils.quoted_name('committees')} as #{FtUtils.quoted_name('commitee')} on task_obj.commitee_committee_id = commitee.id
              left outer join #{FtUtils.quoted_name('committee_roles')} as #{FtUtils.quoted_name('committee_role')} on task_obj.committee_role_committee_role_id = committee_role.id
          #{cond ? ("WHERE "+cond.to_s) : ""}
          ) AS task_objs
          EOS
  end

  def self.query_specs

    # override this method to define query specs - an example is provided
    #   :title - the query title for display
    #   :sql   - the query
    #   :cols  - array mapping out the order in which the columns should appear left-to-right
    #   :where - an expression to place after a where clause in the query
    #   :order_by - comma separated list of column names in array brackets [ ... ]

    @@default_query = default_query()

    @@query_specs = {
      "list_all" => 
        { :title => "List of "+"Task".pluralize,
          :sql  => "SELECT * FROM #{@@default_query}",
          :cols => TaskObj.value_attrs.concat(TaskObj.foreign_key_attrs),
          :where => "name IS NOT NULL",
          :order_by => ['seq_no']
        },
    }

    # set the name of the query in each query spec
    @@query_specs.each{|k,v| v[:name] = k}

    return @@query_specs
  end

  # used in showing query results; gets around method name collisions; returns derived attr values
  # use the least expensive means for html contexts (lists and queries); do full eval for others (e.g. csv)
  def get_attr_val(ft_col_name,ctx='html')
    attr_info = TaskObj.attr_type_info(ft_col_name)
    if attr_info && ["date","datetime","time"].include?(attr_info[:datatype])
      return self.send(ft_col_name)  # applies conversion to configured timezone 
    else
      return self.read_attribute(ft_col_name)
    end
  end

  def self.choices_for(obj,rel_name=nil)
    return TaskObj.find(:all,   :order => 'seq_no,name')
  end

  def self.renumber_seq_nos
    new_sn = 10
    for obj in self.find(:all, :order => "seq_no") do
      obj.seq_no = new_sn
      obj.save 
      new_sn += 10
    end
  end

  def self.reassign_seq_nos(id_seq_no_map)
    new_sn = 10
    id_seq_no_map.each{ |id,seq_no| obj = self.find(id); obj.seq_no = seq_no; obj.save }
    self.find(:all, :order => 'seq_no').each{|obj| obj.seq_no = new_sn; obj.save; new_sn += 10 }
  end

  def before_destroy
  end

#BEGIN-UID.usermethods

  def self.default_query(cond=nil)

    return <<-EOS
          (SELECT task_obj.name as #{FtUtils.quoted_name('name')},
              task_obj.description as #{FtUtils.quoted_name('description')},
              task_obj.month_week as #{FtUtils.quoted_name('month_week')},
              task_obj.key_task as #{FtUtils.quoted_name('key_task')},
              task_obj.seq_no as #{FtUtils.quoted_name('seq_no')},
              concat(100+month.seq_no,'-',10+task_obj.month_week,':Week ',task_obj.month_week,' of ',month.code) as 'timeframe',
              month.seq_no as #{FtUtils.quoted_name('month')},
              month.id as month_month_id,
              meeting.name as #{FtUtils.quoted_name('meeting')},
              meeting.id as meeting_meeting_id,
              predecessor.name as #{FtUtils.quoted_name('predecessor')},
              predecessor.id as predecessor_task_obj_id,
              commitee.code as #{FtUtils.quoted_name('commitee')},
              commitee.id as commitee_committee_id,
              committee_role.role_name as #{FtUtils.quoted_name('committee_role')},
              committee_role.id as committee_role_committee_role_id,
              task_obj.id as id
          FROM
              #{FtUtils.quoted_name('task_objs')} AS #{FtUtils.quoted_name('task_obj')}
              left outer join #{FtUtils.quoted_name('months')} as #{FtUtils.quoted_name('month')} on task_obj.month_month_id = month.id
              left outer join #{FtUtils.quoted_name('meetings')} as #{FtUtils.quoted_name('meeting')} on task_obj.meeting_meeting_id = meeting.id
              left outer join #{FtUtils.quoted_name('task_objs')} as #{FtUtils.quoted_name('predecessor')} on task_obj.predecessor_task_obj_id = predecessor.id
              left outer join #{FtUtils.quoted_name('committees')} as #{FtUtils.quoted_name('commitee')} on task_obj.commitee_committee_id = commitee.id
              left outer join #{FtUtils.quoted_name('committee_roles')} as #{FtUtils.quoted_name('committee_role')} on task_obj.committee_role_committee_role_id = committee_role.id
          #{cond ? ("WHERE "+cond.to_s) : ""}
          ) AS task_objs
          EOS
  end


  def self.choices_for(obj,rel_name=nil)
    return TaskObj.find(:all, :order => 'name')
  end

  def get_attr_val(ft_col_name,ctx='html')
    attr_info = TaskObj.attr_type_info(ft_col_name)
    if attr_info && ["date","datetime","time"].include?(attr_info[:datatype])
      return self.send(ft_col_name)  # applies conversion to configured timezone
    else
      if ft_col_name == 'month' then
        return self.month.code
      elsif ft_col_name == 'timeframe' then
        return self.timeframe.to_s.gsub(/.*:/,'')
      else
        return self.read_attribute(ft_col_name)
      end
    end
  end

#END-UID.usermethods

end
