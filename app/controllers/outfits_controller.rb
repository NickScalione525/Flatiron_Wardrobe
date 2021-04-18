class OutfitsController < ApplicationController

    before_action(:set_outfit, except: [:index, :new, :create])
    before_action(:redirect_if_not_logged_in)
    
    layout "application"
   

    def index
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            @outfits = user.outfits
        else
            @outfits = Outfit.all 
        end
    end

    def show
        # @outfit = Outfit.find_by(id: params[:id])
    end


    def new
        @outfit = Outfit.new
        @outfit.styles.build(user: current_user)
        @styles = @outfit.styles.select{|s| s.user_id == current_user.id}
    end

    def create
        @outfit = Outfit.new(outfit_params)
        @outfit.styles.each {|s| s.user = current_user}
        if @outfit.save
            redirect_to outfit_path(@outfit)
        else
          @errors = ["Outfit Needs A ame, Please Try Again."]
          @styles = @outfit.styles.select{|m| m.user_id == current_user.id}
          render :new
        end
      end

      def edit
      end

  
    def update
        # @outfit = Outfit.find_by(id: params[:id])
        if @outfit.update(outfit_params)
            redirect_to outfits_path
        else
            render 'edit'
        end
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
        @outfit = Outfit.find_by(id: params[:id])
    end



end
