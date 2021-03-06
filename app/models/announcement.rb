
require 'csv'
require 'ft_modules'

class Announcement < ActiveRecord::Base

   include FtUtils

   set_table_name 'announcements'

   belongs_to           :task, :class_name => "TaskObj", :foreign_key => "task_task_obj_id"


   def after_initialize()
     begin
     rescue
     end
   end

   def display_name
      return "Announcement"
   end

   def self.display_name
      return "Announcement"
   end

   def ctrlr_name
      return "announcements"
   end

   def self.iattr_name
      return "topic"
   end

   def iattr_name
      return "topic"
   end

   def iname
      return "" if self.topic.nil? 
      return self.topic.to_s
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
          @@attr_info['topic'] = { :datatype => 'string', :modifier => '', :length => 60, :is_identity_attr => true, :default => '', :mode => 'rw' }
          @@attr_info['description'] = { :datatype => 'text', :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['seq_no'] = { :datatype => 'int'.downcase, :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
        end
        return attr_name.nil? ? @@attr_info : @@attr_info[attr_name.to_s]
    end

    def self.attr_lengths
      { 'topic' => 60 }
    end

    def self.value_attrs
      ["topic","description","seq_no"]
    end

    def self.foreign_key_attrs
       ["task"]
    end

    def self.filter_attrs(attrs)
      valid_keys = self.value_attrs + self.foreign_key_attrs.collect{|fka| foreign_key_attr_info(fka)[:foreign_key]}
      return attrs.reject{|k,v| ! valid_keys.include?(k.to_s)}
    end

    def self.foreign_key_attr_info(fk_attr_name=nil)
      unless defined?(@@fk_attr_info)
        @@fk_attr_info = { }
        @@fk_attr_info['task'] = {:datatype => "TaskObj", :foreign_key => "task_task_obj_id"}
      end

      return fk_attr_name.nil? ? @@fk_attr_info : @@fk_attr_info[fk_attr_name.to_s]
    end

    def self.get_form_fields()
       ["topic","description","seq_no"]
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
        unless row[:topic].to_s.empty? then
          obj = find_or_create_by_topic(row[:topic])

          attrs = row.clone
          attrs.delete_if { |k,v| (! self.value_attrs.member? k.to_s) || v.size == 0 }
          obj.attributes = attrs

          obj.task = TaskObj.find_or_create_by_name(row[:task]) unless row[:task].to_s.empty?

          obj.save()
        end # if identity attr supplied
      }
    end

 public


  # returns the next/prev item given its context of ownership: a) global or b) as a contained item of another object

  def next_item
    item = Announcement.find(:first, :order => FtUtils.quoted_name('topic'), :conditions => ["topic > ? ", self.topic] )
    item = Announcement.find(:first, :order => FtUtils.quoted_name('topic')) if item.nil? 
    return item
  end

  def prev_item
    item = Announcement.find(:first, :order => FtUtils.quoted_name('topic') + ' DESC', :conditions => ["topic < ? ", self.topic] )
    item = Announcement.find(:first, :order => FtUtils.quoted_name('topic') + ' DESC') if item.nil? 
    return item
  end

  def self.items_for_index
    return Announcement.find(:all, :order => 'topic')
  end

  # ---

  def self.default_query(cond=nil)

    return <<-EOS
          (SELECT announcement.topic as #{FtUtils.quoted_name('topic')},
              announcement.description as #{FtUtils.quoted_name('description')},
              announcement.seq_no as #{FtUtils.quoted_name('seq_no')},
              task.name as #{FtUtils.quoted_name('task')},
              task.id as task_task_obj_id,
              announcement.id as id
          FROM
              #{FtUtils.quoted_name('announcements')} AS #{FtUtils.quoted_name('announcement')}
              left outer join #{FtUtils.quoted_name('task_objs')} as #{FtUtils.quoted_name('task')} on announcement.task_task_obj_id = task.id
          #{cond ? ("WHERE "+cond.to_s) : ""}
          ) AS announcements
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
        { :title => "List of "+"Announcement".pluralize,
          :sql  => "SELECT * FROM #{@@default_query}",
          :cols => Announcement.value_attrs.concat(Announcement.foreign_key_attrs),
          :where => "topic IS NOT NULL",
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
    attr_info = Announcement.attr_type_info(ft_col_name)
    if attr_info && ["date","datetime","time"].include?(attr_info[:datatype])
      return self.send(ft_col_name)  # applies conversion to configured timezone 
    else
      return self.read_attribute(ft_col_name)
    end
  end

  def self.choices_for(obj,rel_name=nil)
    return Announcement.find(:all,   :order => 'seq_no,topic')
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

#END-UID.usermethods

end
