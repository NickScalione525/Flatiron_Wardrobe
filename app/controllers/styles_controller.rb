class StylesController < ApplicationController

    layout "application"


    def index
        @styles = Style.all

    end

    def new
        if params[:outfit_id]
            @outfit = Outfit.find_by(id: params[:item_id])
            @style = @outfit.styles.build
            @styles = Style.all


        else
            @style = Style.new
            @styles = Style.all
        end

    end

    def create
        @style = Style.create(style_params)

        redirect_to outfit_path

    end

  
end
