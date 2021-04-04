module StylesHelper


    def form_url_helper
        @outfit ? outfit_styles_path(@outfit) : styles_path
    end
end
