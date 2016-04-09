class MainController < ApplicationController
    def index
        
        
    end
    
    def write
        @title = params[:title]
        @content = params[:content]
    end
    
end
