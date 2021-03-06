
require 'csv'
require 'ft_modules'

class CommitteeRole < ActiveRecord::Base

   include FtUtils

   set_table_name 'committee_roles'

   has_many             :meetings, :class_name => "Meeting", :foreign_key => "facilitator_committee_role_id"
   has_many             :tasks, :class_name => "TaskObj", :foreign_key => "committee_role_committee_role_id"
   has_many             :assignments, :class_name => "RoleAssignment", :foreign_key => "committee_role_committee_role_id"
   has_and_belongs_to_many :meetings, :class_name => "Meeting", :join_table => "meetings_invitees_committee_roles", :association_foreign_key => "meeting_src_id", :foreign_key => "committee_role_dest_id"

   belongs_to           :committee, :class_name => "Committee", :foreign_key => "committee_committee_id"


   def after_initialize()
     begin
     rescue
     end
   end

   def display_name
      return "Committee Role"
   end

   def self.display_name
      return "Committee Role"
   end

   def ctrlr_name
      return "committee_roles"
   end

   def self.iattr_name
      return "role_name"
   end

   def iattr_name
      return "role_name"
   end

   def iname
      return "" if self.role_name.nil? 
      return self.role_name.to_s
   end

   def qname
      q_name = iname()
      q_name = committee.qname() + " > " + q_name if committee
      return q_name
   end

   def sname
       return self.qname
   end

   def container_qname
      return (committee && committee.qname) || ""
   end

   def container_obj
      return nil || committee
   end

  def move_targets()
    targets = Committee.find(:all)
    targets = targets - [self.container_obj()] if self.container_obj()
    return targets
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
          @@attr_info['role_name'] = { :datatype => 'string', :modifier => '', :length => 60, :is_identity_attr => true, :default => '', :mode => 'rw' }
          @@attr_info['description'] = { :datatype => 'text', :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['calling_required'] = { :datatype => 'boolean'.downcase, :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['name_tag_needed'] = { :datatype => 'boolean'.downcase, :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['seq_no'] = { :datatype => 'int'.downcase, :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
        end
        return attr_name.nil? ? @@attr_info : @@attr_info[attr_name.to_s]
    end

    def self.attr_lengths
      { 'role_name' => 60 }
    end

    def self.value_attrs
      ["role_name","description","calling_required","name_tag_needed","seq_no"]
    end

    def self.foreign_key_attrs
       ["committee"]
    end

    def self.filter_attrs(attrs)
      valid_keys = self.value_attrs + self.foreign_key_attrs.collect{|fka| foreign_key_attr_info(fka)[:foreign_key]}
      return attrs.reject{|k,v| ! valid_keys.include?(k.to_s)}
    end

    def self.foreign_key_attr_info(fk_attr_name=nil)
      unless defined?(@@fk_attr_info)
        @@fk_attr_info = { }
        @@fk_attr_info['committee'] = {:datatype => "Committee", :foreign_key => "committee_committee_id"}
      end

      return fk_attr_name.nil? ? @@fk_attr_info : @@fk_attr_info[fk_attr_name.to_s]
    end

    def self.get_form_fields()
       ["role_name","description","calling_required","name_tag_needed","seq_no"]
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
        unless row[:role_name].to_s.empty? then
          obj = find_or_create_by_role_name(row[:role_name])

          attrs = row.clone
          attrs.delete_if { |k,v| (! self.value_attrs.member? k.to_s) || v.size == 0 }
          obj.attributes = attrs

          obj.committee = Committee.find_or_create_by_code(row[:committee]) unless row[:committee].to_s.empty?

          obj.save()
        end # if identity attr supplied
      }
    end

 public


  # returns the next/prev item given its context of ownership: a) global or b) as a contained item of another object

  def next_at_top
    item = CommitteeRole.find(:first, :order => FtUtils.quoted_name('role_name'), :conditions => ["role_name > ? AND committee_committee_id is null", self.role_name] )
    item = CommitteeRole.find(:first, :order => FtUtils.quoted_name('role_name'), :conditions => "committee_committee_id is null") if item.nil? 
    return item
  end

  def prev_at_top
    item = CommitteeRole.find(:first, :order => FtUtils.quoted_name('role_name') + ' DESC', :conditions => ["role_name < ? AND committee_committee_id is null", self.role_name] )
    item = CommitteeRole.find(:first, :order => FtUtils.quoted_name('role_name') + ' DESC', :conditions => "committee_committee_id is null") if item.nil? 
    return item
  end

  def next_item
    return next_at_top() unless self.container_obj()
    item = self.container_obj().committee_roles.find(:first, :order => FtUtils.quoted_name('role_name'), :conditions => ["role_name > ? ", self.role_name] )
    item = self.container_obj().committee_roles.find(:first, :order => FtUtils.quoted_name('role_name')) if item.nil? 
    return item
  end

  def prev_item
    return prev_at_top() unless self.container_obj()
    item = self.container_obj().committee_roles.find(:first, :order => FtUtils.quoted_name('role_name') + ' DESC', :conditions => ["role_name < ? ", self.role_name] )
    item = self.container_obj().committee_roles.find(:first, :order => FtUtils.quoted_name('role_name') + ' DESC') if item.nil? 
    return item
  end

  def self.items_for_index
    return CommitteeRole.find(:all, :order => 'role_name')
  end

  # ---

  def self.default_query(cond=nil)

    return <<-EOS
          (SELECT committee_role.role_name as #{FtUtils.quoted_name('role_name')},
              committee_role.description as #{FtUtils.quoted_name('description')},
              committee_role.calling_required as #{FtUtils.quoted_name('calling_required')},
              committee_role.name_tag_needed as #{FtUtils.quoted_name('name_tag_needed')},
              committee_role.seq_no as #{FtUtils.quoted_name('seq_no')},
              committee.code as #{FtUtils.quoted_name('committee')},
              committee.id as committee_committee_id,
              committee_role.id as id
          FROM
              #{FtUtils.quoted_name('committee_roles')} AS #{FtUtils.quoted_name('committee_role')}
              left outer join #{FtUtils.quoted_name('committees')} as #{FtUtils.quoted_name('committee')} on committee_role.committee_committee_id = committee.id
          #{cond ? ("WHERE "+cond.to_s) : ""}
          ) AS committee_roles
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
        { :title => "List of "+"Committee Role".pluralize,
          :sql  => "SELECT * FROM #{@@default_query}",
          :cols => CommitteeRole.value_attrs.concat(CommitteeRole.foreign_key_attrs),
          :where => "role_name IS NOT NULL",
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
    attr_info = CommitteeRole.attr_type_info(ft_col_name)
    if attr_info && ["date","datetime","time"].include?(attr_info[:datatype])
      return self.send(ft_col_name)  # applies conversion to configured timezone 
    else
      return self.read_attribute(ft_col_name)
    end
  end

  def self.choices_for(obj,rel_name=nil)
    return CommitteeRole.find(:all,   :order => 'seq_no,role_name')
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
