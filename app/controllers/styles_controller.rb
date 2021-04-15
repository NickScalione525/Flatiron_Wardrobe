class StylesController < ApplicationController
    before_action(:redirect_if_not_logged_in)  
    before_action(:set_style)
    

    layout "application"


    def index
 
      if params[:outfit_id]
          @outfit = Outfit.find_by(id: params[:outfit_id])
          @styles = @outfit.styles
      else
          @styles = Style.all 
      end
  end

    def new
        if params[:outfit_id]
            @outfit = Outfit.find_by(id: params[:outfit_id])
            @style = @outfit.styles.build
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
        end
          if @style.save
           
          redirect_to outfits_path
          else
            render :new
        
    end
    end

  
    def edit
        if @style.user != current_user
          flash[:message] = "That is not your style!"
          redirect_to '/styles'
        end
          # @items = Item.all
      end
    
      def update
    
        if @style.update(style_params)
          redirect_to styles_path
        else
          render :edit
        end
      end

      def destroy
        @style.delete
        redirect_to outfits_path
      end
      

    private

    def style_params
        params.require(:style).permit(:name, :era, :outfit_id)
    end

    def set_style
      @style = Style.find_by(id: params[:id])
end
end
