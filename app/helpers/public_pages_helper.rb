module PublicPagesHelper

   def url_show_one(obj)
       return "#" unless obj
       return url_for( :controller => 'public_pages', :object => obj.class.name, :action => 'show_one', :id => obj.id )
   end

#BEGIN-UID.usermethods

#END-UID.usermethods

end
