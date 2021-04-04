class OutfitsController < ApplicationController
    
    layout "application"

    def index
            @outfits = Outfit.all
    end

    def show
        @outfit = Outfit.find_by(id: params[:id])
    end


    def new
        @outfit = Outfit.new
        @outfit.styles.build
    end

    def create
        @outfit = Outfit.new(outfit_params)
        if @outfit.save
            redirect_to outfit_path(@outfit)

        else
            @errors = @outfit.errors.full_messages
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
        params.require(:outfit).permit(:id, :name, :top, :bottom, :shoes, :accessories, styles_attributes: [ :name, :era])
    end

    def set_outfit
        @outfit = Outfit.find(params[:id])
    end



end
