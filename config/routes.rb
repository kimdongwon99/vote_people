Rails.application.routes.draw do
  
  devise_for :users
  root 'home#login'
  
  get '/index'=>'home#index'
  post '/index'=>'home#index'
  
  #create
  get '/home/register' => 'home#register'
  post '/home/create' => 'home#create' 
  
  #read
  
  
  #root는 메인페이지설정 = get '/' => 'home#index' 
  get '/home/show/:post_id' => 'home#show'
  
  #Update
  get '/home/edit/:post_id' => 'home#edit'
  get '/home/update/:post_id' => 'home#update'
 
  #Delete
  get '/home/destroy/:post_id' => 'home#destroy'
end
