class IndexController < ApplicationController

  def index
    @ft_subject = "FHC Committee"
    @ft_activity  = "Contents"
    render :action => @ft_custom_action if @ft_custom_action
  end

#BEGIN-UID.usermethods

#END-UID.usermethods


end
