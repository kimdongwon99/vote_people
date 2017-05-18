class HomeController < ApplicationController
  def index
  @titledata=params[:title]
   
    @contentdata=params[:content]
    
    @content2data=params[:content2]
    
  end
  
  
  
  def home
    unless user_signed_in?
        redirect_to "/index"
    end
  end
  
end
    