class HomeController < ApplicationController
    
    def index
        # render 'index'
        @study_items = StudyItem.all()        
    end
end