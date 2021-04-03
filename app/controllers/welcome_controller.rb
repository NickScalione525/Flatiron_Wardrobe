class WelcomeController < ApplicationController
    def home
      redirect_to outfits_path if logged_in?
    end
  end
  