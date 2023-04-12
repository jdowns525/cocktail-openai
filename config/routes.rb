Rails.application.routes.draw do
  root 'stories#index'


  get 'stories/index'
end
