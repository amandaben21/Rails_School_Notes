class SubjectsController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def index
        @subjects = Subject.alpha
    end

    def show
        @subject = Subject.find_by_id(params[:id])
    end
end
