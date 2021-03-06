class PublicPagesController < ApplicationController

    # this file is only generated if it does not already exist - you may safely change its contents

    def index
        redirect_to :action => 'main'
    end

    def main
        @ft_subject = "Public Interface"
        @ft_activity = "Main Page"
        @settings = { :logo => "logo.png", :name => "Major Title", :page_subtitle => "Minor Title" } 
    end

end

