class StylesController < ApplicationController

    layout "application"


    def index
        @styles = Style.all

    end

    def new
        if params[:outfit_id]
            @outfit = Outfit.find_by(id: params[:item_id])
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
        @style.save

        redirect_to outfit_path

    end

    private

    def style_params
        params.require(:style).permit(:name, :era, :outfit_id)
    end

end
