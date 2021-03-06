
require 'csv'
require 'ft_modules'

class Volunteer < ActiveRecord::Base

   include FtUtils

   set_table_name 'volunteers'

   has_many             :assignments, :class_name => "RoleAssignment", :foreign_key => "volunteer_volunteer_id"


   def after_initialize()
     begin
       self.created_at = Time.now   unless self.attribute_present?('created_at')
     rescue
     end
   end

   def display_name
      return "Volunteer"
   end

   def self.display_name
      return "Volunteer"
   end

   def ctrlr_name
      return "volunteers"
   end

   def self.iattr_name
      return "l_name"
   end

   def iattr_name
      return "l_name"
   end

   def iname
      return "" if self.l_name.nil? 
      return self.l_name.to_s
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
          @@attr_info['l_name'] = { :datatype => 'string', :modifier => '', :length => 60, :is_identity_attr => true, :default => '', :mode => 'rw' }
          @@attr_info['f_name'] = { :datatype => 'string', :modifier => '', :length => 60, :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['full_name'] = { :datatype => 'string', :modifier => '', :length => 60, :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['email'] = { :datatype => 'string', :modifier => '', :length => 60, :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['email_confirmed'] = { :datatype => 'boolean'.downcase, :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['user_name'] = { :datatype => 'string', :modifier => '', :length => 60, :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['passwd'] = { :datatype => 'string', :modifier => '', :length => 40, :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['address_line1'] = { :datatype => 'string', :modifier => '', :length => 60, :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['address_line2'] = { :datatype => 'string', :modifier => '', :length => 60, :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['city'] = { :datatype => 'string', :modifier => '', :length => 60, :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['state'] = { :datatype => 'string', :modifier => 'enum', :length => 60, :is_identity_attr => false, :default => '', :values => 'AL,AK,AS,AZ,AR,CA,CO,CT,DE,DC,FM,FL,GA,GU,HI,ID,IL,IN,IA,KS,KY,LA,ME,MH,MD,MA,MI,MN,MS,MO,MT,NE,NV,NH,NJ,NM,NY,NC,ND,MP,OH,OK,OR,PW,PA,PR,RI,SC,SD,TN,TX,UT,VT,VI,VA,WA,WV,WI,WY', :mode => 'rw' }
          @@attr_info['zipcode'] = { :datatype => 'string', :modifier => '', :length => 60, :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['cell_phone'] = { :datatype => 'string', :modifier => '', :length => 60, :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['home_phone'] = { :datatype => 'string', :modifier => '', :length => 60, :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['work_phone'] = { :datatype => 'string', :modifier => '', :length => 60, :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['missionary_ind'] = { :datatype => 'boolean'.downcase, :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
          @@attr_info['created_at'] = { :datatype => 'Date'.downcase, :modifier => '', :is_identity_attr => false, :default => '', :mode => 'rw' }
        end
        return attr_name.nil? ? @@attr_info : @@attr_info[attr_name.to_s]
    end

    def self.attr_lengths
      { 'l_name' => 60, 'f_name' => 60, 'full_name' => 60, 'email' => 60, 'user_name' => 60, 'passwd' => 40, 'address_line1' => 60, 'address_line2' => 60, 'city' => 60, 'state' => 60, 'zipcode' => 60, 'cell_phone' => 60, 'home_phone' => 60, 'work_phone' => 60 }
    end

    def self.value_attrs
      ["l_name","f_name","full_name","email","email_confirmed","user_name","passwd","address_line1","address_line2","city","state","zipcode","cell_phone","home_phone","work_phone","missionary_ind","created_at"]
    end

    def self.foreign_key_attrs
       []
    end

    def self.filter_attrs(attrs)
      valid_keys = self.value_attrs + self.foreign_key_attrs.collect{|fka| foreign_key_attr_info(fka)[:foreign_key]}
      return attrs.reject{|k,v| ! valid_keys.include?(k.to_s)}
    end

    def self.foreign_key_attr_info(fk_attr_name=nil)
      unless defined?(@@fk_attr_info)
        @@fk_attr_info = { }
      end

      return fk_attr_name.nil? ? @@fk_attr_info : @@fk_attr_info[fk_attr_name.to_s]
    end

    def self.get_form_fields()
       ["l_name","f_name","full_name","email","email_confirmed","user_name","passwd","address_line1","address_line2","city","state","zipcode","cell_phone","home_phone","work_phone","missionary_ind"]
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
        unless row[:l_name].to_s.empty? then
          obj = find_or_create_by_l_name(row[:l_name])

          attrs = row.clone
          attrs.delete_if { |k,v| (! self.value_attrs.member? k.to_s) || v.size == 0 }
          obj.attributes = attrs


          obj.save()
        end # if identity attr supplied
      }
    end

 public


  # returns the next/prev item given its context of ownership: a) global or b) as a contained item of another object

  def next_item
    item = Volunteer.find(:first, :order => FtUtils.quoted_name('l_name'), :conditions => ["l_name > ? ", self.l_name] )
    item = Volunteer.find(:first, :order => FtUtils.quoted_name('l_name')) if item.nil? 
    return item
  end

  def prev_item
    item = Volunteer.find(:first, :order => FtUtils.quoted_name('l_name') + ' DESC', :conditions => ["l_name < ? ", self.l_name] )
    item = Volunteer.find(:first, :order => FtUtils.quoted_name('l_name') + ' DESC') if item.nil? 
    return item
  end

  def self.items_for_index
    return Volunteer.find(:all, :order => 'l_name')
  end

  # ---

  def self.default_query(cond=nil)

    return <<-EOS
          (SELECT volunteer.l_name as #{FtUtils.quoted_name('l_name')},
              volunteer.f_name as #{FtUtils.quoted_name('f_name')},
              volunteer.full_name as #{FtUtils.quoted_name('full_name')},
              volunteer.email as #{FtUtils.quoted_name('email')},
              volunteer.email_confirmed as #{FtUtils.quoted_name('email_confirmed')},
              volunteer.user_name as #{FtUtils.quoted_name('user_name')},
              volunteer.passwd as #{FtUtils.quoted_name('passwd')},
              volunteer.address_line1 as #{FtUtils.quoted_name('address_line1')},
              volunteer.address_line2 as #{FtUtils.quoted_name('address_line2')},
              volunteer.city as #{FtUtils.quoted_name('city')},
              volunteer.state as #{FtUtils.quoted_name('state')},
              volunteer.zipcode as #{FtUtils.quoted_name('zipcode')},
              volunteer.cell_phone as #{FtUtils.quoted_name('cell_phone')},
              volunteer.home_phone as #{FtUtils.quoted_name('home_phone')},
              volunteer.work_phone as #{FtUtils.quoted_name('work_phone')},
              volunteer.missionary_ind as #{FtUtils.quoted_name('missionary_ind')},
              volunteer.created_at as #{FtUtils.quoted_name('created_at')},
              volunteer.id as id
          FROM
              #{FtUtils.quoted_name('volunteers')} AS #{FtUtils.quoted_name('volunteer')}
          #{cond ? ("WHERE "+cond.to_s) : ""}
          ) AS volunteers
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
        { :title => "List of "+"Volunteer".pluralize,
          :sql  => "SELECT * FROM #{@@default_query}",
          :cols => Volunteer.value_attrs.concat(Volunteer.foreign_key_attrs),
          :where => "l_name IS NOT NULL",
          :order_by => ['l_name']
        },
    }

    # set the name of the query in each query spec
    @@query_specs.each{|k,v| v[:name] = k}

    return @@query_specs
  end

  # used in showing query results; gets around method name collisions; returns derived attr values
  # use the least expensive means for html contexts (lists and queries); do full eval for others (e.g. csv)
  def get_attr_val(ft_col_name,ctx='html')
    attr_info = Volunteer.attr_type_info(ft_col_name)
    if attr_info && ["date","datetime","time"].include?(attr_info[:datatype])
      return self.send(ft_col_name)  # applies conversion to configured timezone 
    else
      return self.read_attribute(ft_col_name)
    end
  end

  def self.choices_for(obj,rel_name=nil)
    return Volunteer.find(:all,  :order => 'l_name')
  end

  def before_destroy
  end

#BEGIN-UID.usermethods

   def iname
      return "" if self.l_name.nil?
      return self.f_name + ' ' + self.l_name
   end

#END-UID.usermethods

end
