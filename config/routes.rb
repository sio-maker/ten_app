Rails.application.routes.draw do
 
  
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
}
 
  resources :users, :only => [:show]
  post 'comments/:id' =>"comments#create",as:'comment'
  delete 'comments/:post_id/:id'=>"comments#destroy",as:'destroy_comment'
  post 'relationship/:id'=>"relationships#create",as:'create_relationship'
  delete'relationship/:id'=>"relationships#destroy",as:'destroy_relationship'
  root 'home#top'
  post "likes/:post_id/create"=>"likes#create",as:'create_like'
  post "likes/:post_id/destroy"=>"likes#destroy",as:'destroy_like'
  get 'posts'=>'posts#index'
  get "posts/new"=>"posts#new"
  post "posts"=>"posts#create"
  get "posts/:id"=>"posts#show",as:'post'
  patch 'posts/:id' => 'posts#update'
  delete 'posts/:id' => 'posts#destroy' 
  get 'posts/:id/edit' => 'posts#edit', as:'edit_post'
  post 'posts/:id/done'=>'posts#done',as:'done_post'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
