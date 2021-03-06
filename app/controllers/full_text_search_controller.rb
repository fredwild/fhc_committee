class FullTextSearchController < ApplicationController

  layout :none

  def search
    @search_text = params[:search_text]
    redirect_to :back if ! @search_text || @search_text.size == 0

    @pattern_to_find = /#{@search_text}/i
    @results = Array.new()

    rows = Month.find(:all)
    rows.each { |instance|
        if instance.code && instance.code.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'code' }
        end
        if instance.description && instance.description.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'description' }
        end
        
    }
    rows = Document.find(:all)
    rows.each { |instance|
        if instance.name && instance.name.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'name' }
        end
        if instance.description && instance.description.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'description' }
        end
        if instance.doc_file && instance.doc_file.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'doc_file' }
        end
        
    }
    rows = Event.find(:all)
    rows.each { |instance|
        if instance.objectives && instance.objectives.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'objectives' }
        end
        
    }
    rows = Announcement.find(:all)
    rows.each { |instance|
        if instance.topic && instance.topic.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'topic' }
        end
        if instance.description && instance.description.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'description' }
        end
        
    }
    rows = Volunteer.find(:all)
    rows.each { |instance|
        if instance.l_name && instance.l_name.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'l_name' }
        end
        if instance.f_name && instance.f_name.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'f_name' }
        end
        if instance.full_name && instance.full_name.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'full_name' }
        end
        if instance.email && instance.email.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'email' }
        end
        if instance.user_name && instance.user_name.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'user_name' }
        end
        if instance.passwd && instance.passwd.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'passwd' }
        end
        if instance.address_line1 && instance.address_line1.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'address_line1' }
        end
        if instance.address_line2 && instance.address_line2.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'address_line2' }
        end
        if instance.city && instance.city.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'city' }
        end
        if instance.state && instance.state.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'state' }
        end
        if instance.zipcode && instance.zipcode.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'zipcode' }
        end
        if instance.cell_phone && instance.cell_phone.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'cell_phone' }
        end
        if instance.home_phone && instance.home_phone.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'home_phone' }
        end
        if instance.work_phone && instance.work_phone.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'work_phone' }
        end
        
    }
    rows = Meeting.find(:all)
    rows.each { |instance|
        if instance.name && instance.name.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'name' }
        end
        if instance.purpose && instance.purpose.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'purpose' }
        end
        if instance.agenda && instance.agenda.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'agenda' }
        end
        if instance.notes && instance.notes.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'notes' }
        end
        
    }
    rows = TaskObj.find(:all)
    rows.each { |instance|
        if instance.name && instance.name.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'name' }
        end
        if instance.description && instance.description.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'description' }
        end
        
    }
    rows = Committee.find(:all)
    rows.each { |instance|
        if instance.code && instance.code.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'code' }
        end
        if instance.name && instance.name.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'name' }
        end
        if instance.description && instance.description.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'description' }
        end
        if instance.picture && instance.picture.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'picture' }
        end
        
    }
    rows = WebsiteFunction.find(:all)
    rows.each { |instance|
        if instance.name && instance.name.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'name' }
        end
        if instance.description && instance.description.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'description' }
        end
        if instance.link && instance.link.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'link' }
        end
        
    }
    rows = CommitteeRole.find(:all)
    rows.each { |instance|
        if instance.role_name && instance.role_name.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'role_name' }
        end
        if instance.description && instance.description.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'description' }
        end
        
    }
    rows = RoleAssignment.find(:all)
    rows.each { |instance|
        if instance.name && instance.name.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'name' }
        end
        
    }
    rows = Resource.find(:all)
    rows.each { |instance|
        if instance.name && instance.name.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'name' }
        end
        if instance.description && instance.description.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'description' }
        end
        if instance.picture && instance.picture.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'picture' }
        end
        if instance.doc_file && instance.doc_file.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'doc_file' }
        end
        if instance.link && instance.link.to_s.index(@pattern_to_find)
            @results << { :obj => instance, :field => 'link' }
        end
        
    }

  end


#BEGIN-UID.usermethods

#END-UID.usermethods


end
