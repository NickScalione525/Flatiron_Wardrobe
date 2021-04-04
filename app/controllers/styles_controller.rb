class StylesController < ApplicationController

    layout "application"


    def index
        @styles = Style.all

    end

    def new
        if params[:outfit_id]
            @outfit = Outfit.find_by(id: params[:outfit_id])
            @style = Style.new
            @styles = Style.all


        else
            @style = Style.new
            @styles = Style.all
        end

    end

    def create
        @style = Style.create(style_params)
        @style.user = current_user
        if params[:outfit_id]
        @style.outfit_id = params[:outfit_id]
        @style.save

        redirect_to outfits_path
        end
    end

    private

    def style_params
        params.require(:style).permit(:name, :era, :outfit_id)
    end

end
