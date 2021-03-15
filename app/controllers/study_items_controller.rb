class StudyItemsController < ApplicationController
    def show
        id = params[:id]
        @study_item = StudyItem.find(id)
    end

    def new
        @study_item = StudyItem.new
    end

    def create
        si_params = params.require(:study_item).permit(:title, 
            :category, :done)
        @study_item = StudyItem.new(si_params)

        # @study_item.title = params[:study_item][:title]
        # @study_item.category = params[:study_item][:category]
        # @study_item.done = params[:study_item][:done]

        if @study_item.save
            flash[:alert] = 'item de estudo adicionado'
            redirect_to root_path
        else
            flash[:alert] = 'não foi possivel adicionar o item de estudo'
            render "new"
        end
    end

    def edit
        id = params[:id]
        @study_item = StudyItem.find(id)
    end

    def update
        id = params[:id]
        @study_item = StudyItem.find(id)

        if @study_item.update( params.require(:study_item).permit(:title, 
            :category, :done) )
            # redirect_to @study_item
            redirect_to root_path
        else
            render "edit"
        end    
    end

    def mark_as_done
        id = params[:id]
        @study_item = StudyItem.find(id)
        @study_item.done!
        redirect_to @study_item
        # redirect_to root_path
    end
end