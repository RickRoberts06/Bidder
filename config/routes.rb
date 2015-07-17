Rails.application.routes.draw do

  root "auctions#index"

  resources :sessions

  resources :users do
    get :my_bids, on: :member
  end

  resources :auctions do
    resources :bids
  end

end
