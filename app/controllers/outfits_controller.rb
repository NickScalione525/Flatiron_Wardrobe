class OutfitsController < ApplicationController

    before_action(:set_outfit, except: [:index, :new, :create])
    before_action(:redirect_if_not_logged_in)
    
    layout "application"
   

    def index
            @outfits = Outfit.all
    end

    def show
        @outfit = Outfit.find_by(id: params[:id])
    end


    def new
        @outfit = Outfit.new
        @outfit.styles.build(user: current_user)
        @styles = @outfit.styles.where(user_id: current_user.id)
    end

    def create
        @outfit = Outfit.new(outfit_params)
        @outfit.styles.each {|m| m.user = current_user}
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
        @outfit.delete
        redirect_to root_path
    end
 

    private

    def outfit_params
        params.require(:outfit).permit(:id, :name, :top, :bottom, :shoes, :accessories, :times_worn, styles_attributes: [ :name, :era, :user_id])
    end

    def set_outfit
        @outfit = Outfit.find(params[:id])
    end



end
