class Api::V1::ThemesController < ApplicationController
    
    def index
        themes = Theme.all
        render json: themes
    end
    
end
