
require 'csv'
require 'ft_modules'

class Meeting < ActiveRecord::Base

   include FtUtils

   set_table_name 'meetings'

   has_many             :tasks_addressed, :class_name => "TaskObj", :foreign_key => "meeting_meeting_id"
   has_and_belongs_to_many :invitees, :class_name => "CommitteeRole", :join_table => "meetings_invitees_committee_roles", :foreign_key => "meeting_src_id", :association_foreign_key => "committee_role_dest_id"

   has_and_belongs_to_many :resources, :class_name => "Resource", :join_table => "meetings_resources_resources", :foreign_key => "meeting_src_id", :association_foreign_key => "resource_dest_id"

   belongs_to           :month, :class_name => "Month", :foreign_key => "month_month_id"
   belongs_to           :facilitator, :class_name => "CommitteeRole", :foreign_key => "facilitator_committee_role_id"


   def after_initialize()
     begin
     rescue
     end
   end

   def display_name
      return "Meeting"
   end

   def self.display_name
      return "Meeting"
   end

   def ctrlr_name
      return "meetings"
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
          @@attr_info['purpose'] = { :datatype => 'string', :modifier => '', :length => 100, :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['agenda'] = { :datatype => 'text', :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['month_week'] = { :datatype => 'int'.downcase, :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['notes'] = { :datatype => 'text', :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['seq_no'] = { :datatype => 'int'.downcase, :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
        end
        return attr_name.nil? ? @@attr_info : @@attr_info[attr_name.to_s]
    end

    def self.attr_lengths
      { 'name' => 60, 'purpose' => 100 }
    end

    def self.value_attrs
      ["name","purpose","agenda","month_week","notes","seq_no"]
    end

    def self.foreign_key_attrs
       ["month","facilitator"]
    end

    def self.filter_attrs(attrs)
      valid_keys = self.value_attrs + self.foreign_key_attrs.collect{|fka| foreign_key_attr_info(fka)[:foreign_key]}
      return attrs.reject{|k,v| ! valid_keys.include?(k.to_s)}
    end

    def self.foreign_key_attr_info(fk_attr_name=nil)
      unless defined?(@@fk_attr_info)
        @@fk_attr_info = { }
        @@fk_attr_info['month'] = {:datatype => "Month", :foreign_key => "month_month_id"}
        @@fk_attr_info['facilitator'] = {:datatype => "CommitteeRole", :foreign_key => "facilitator_committee_role_id"}
      end

      return fk_attr_name.nil? ? @@fk_attr_info : @@fk_attr_info[fk_attr_name.to_s]
    end

    def self.get_form_fields()
       ["name","purpose","agenda","month_week","notes","seq_no"]
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
          obj.facilitator = CommitteeRole.find_or_create_by_role_name(row[:facilitator]) unless row[:facilitator].to_s.empty?

          obj.save()
        end # if identity attr supplied
      }
    end

 public


  # returns the next/prev item given its context of ownership: a) global or b) as a contained item of another object

  def next_item
    item = Meeting.find(:first, :order => FtUtils.quoted_name('name'), :conditions => ["name > ? ", self.name] )
    item = Meeting.find(:first, :order => FtUtils.quoted_name('name')) if item.nil? 
    return item
  end

  def prev_item
    item = Meeting.find(:first, :order => FtUtils.quoted_name('name') + ' DESC', :conditions => ["name < ? ", self.name] )
    item = Meeting.find(:first, :order => FtUtils.quoted_name('name') + ' DESC') if item.nil? 
    return item
  end

  def self.items_for_index
    return Meeting.find(:all, :order => 'name')
  end

  # ---

  def self.default_query(cond=nil)

    return <<-EOS
          (SELECT meeting.name as #{FtUtils.quoted_name('name')},
              meeting.purpose as #{FtUtils.quoted_name('purpose')},
              meeting.agenda as #{FtUtils.quoted_name('agenda')},
              meeting.month_week as #{FtUtils.quoted_name('month_week')},
              meeting.notes as #{FtUtils.quoted_name('notes')},
              meeting.seq_no as #{FtUtils.quoted_name('seq_no')},
              month.seq_no as #{FtUtils.quoted_name('month')},
              month.id as month_month_id,
              facilitator.role_name as #{FtUtils.quoted_name('facilitator')},
              facilitator.id as facilitator_committee_role_id,
              meeting.id as id
          FROM
              #{FtUtils.quoted_name('meetings')} AS #{FtUtils.quoted_name('meeting')}
              left outer join #{FtUtils.quoted_name('months')} as #{FtUtils.quoted_name('month')} on meeting.month_month_id = month.id
              left outer join #{FtUtils.quoted_name('committee_roles')} as #{FtUtils.quoted_name('facilitator')} on meeting.facilitator_committee_role_id = facilitator.id
          #{cond ? ("WHERE "+cond.to_s) : ""}
          ) AS meetings
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
        { :title => "List of "+"Meeting".pluralize,
          :sql  => "SELECT * FROM #{@@default_query}",
          :cols => Meeting.value_attrs.concat(Meeting.foreign_key_attrs),
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
    attr_info = Meeting.attr_type_info(ft_col_name)
    if attr_info && ["date","datetime","time"].include?(attr_info[:datatype])
      return self.send(ft_col_name)  # applies conversion to configured timezone 
    else
      return self.read_attribute(ft_col_name)
    end
  end

  def self.choices_for(obj,rel_name=nil)
    return Meeting.find(:all,   :order => 'seq_no,name')
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

  def timeframe 
    "Week #{self.month_week} of #{month.iname}"
  end

  def get_attr_val(ft_col_name,ctx='html')
    attr_info = Meeting.attr_type_info(ft_col_name)
    if attr_info && ["date","datetime","time"].include?(attr_info[:datatype])
      return self.send(ft_col_name)  # applies conversion to configured timezone
    else
      if ft_col_name == "timeframe"
        return self.timeframe.gsub(/.*:/,'')
      else
        return self.read_attribute(ft_col_name)
      end
    end
  end

#END-UID.usermethods

end
