class HomeController < ApplicationController
  def index
   
  end
  
  def home
    unless user_signed_in?
        redirect_to "/index"
   end
  end
end
