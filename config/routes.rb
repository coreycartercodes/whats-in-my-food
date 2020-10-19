Rails.application.routes.draw do
  root "welcome#index"
  resource :foods, only: index
end
