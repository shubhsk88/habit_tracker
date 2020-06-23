class GroupsController < ApplicationController

    def index
        @group=Group.all

        
    end

    def new
      @group=Group.new

    end

    def show
        @group = Group.includes(sessions: [:author]).find_by(name: params[:name])
    end

    def create
        @group=Group.new(group_params)
        if(@group.save)
            redirect_to users_path(current_user),notice:"Group sucessfully created"

        else
            render :new
        end 
        
       
    end

    private
    def group_params
        params.require(:group).permit(:name,:icon)
    end

    
end
