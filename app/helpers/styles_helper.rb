module StylesHelper


    # def show_outfit_name(s, index)
    #     s.outfit.name if index
    # end

    def form_url_helper(outfit)
        outfit ? outfit_styles_path(outfit) : styles_path
    end
end
