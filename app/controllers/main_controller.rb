require 'mailgun'
class MainController < ApplicationController
    def index
        
        
    end
    
    def write
        
        @email = params[:email]
        @title = params[:title]
        @content = params[:content]
        
        mg_client = Mailgun::Client.new("key-ec3ca6dd228d53d56e9d1b3415469222")
        message_params =  {
                   from: 'hkh7670@gmail.com',
                   to:   @email,
                   subject: @title,
                   text:    @content
                  }
                  
        result = mg_client.send_message('sandbox0b8b8ef931aa4621ba89bc43c52ec318.mailgun.org', message_params).to_h!
        message_id = result['id']
        message = result['message']
        
        new_post = Post.new
        new_post.title = params[:title]
        new_post.email = params[:email]
        new_post.content = params[:content]
        new_post.save
        
        redirect_to "/list"
    end
    
    def list
        @every_post = Post.all.order("id desc")
    end
end
