class OutfitsController < ApplicationController
    before_action :set_outfit, only: [:show, :edit, :update, :destroy]

    def index
            @outfits = Outfit.all
    end

    def show

    end

    def new
        @outfit = Outfit.new
    end

    def create
        @outfit = Outfit.create(outfit_params)
        @outfit.users = current_user
        if params[:user_id]

        else
            render 'new'
        end
    end
    def update
        if @outfit.update(outfit_params)
            redirect_to @outfit
        else
            render 'edit'
        end
    end

    def edit
    end

    def destroy
        @outfit.destroy
        redirect_to root_path
    end
 

    private

    def outfit_params
        params.require(:outfit).permit(:id, :top, :bottom, :shoes, :accessories, style_ids:[], styles_attributes: [ :id, :name, :era])
    end

    def set_outfit
        @outfit = Outfit.find(params[:id])
    end



end
