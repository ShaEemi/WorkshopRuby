Rails.application.routes.draw do

resources :bopartis
resources :contacts

get 'inscription' => 'electeurs#new'
post 'inscription' => 'electeurs#create'
resources :electeurs
get 'connexion' => 'sessions#new'
post 'connexion' => 'sessions#create'
get 'deconnexion' => 'sessions#destroy'
# resources :connexion
root 'actualites#index'

resources :bogestionelections
resources :candidats
resources :votes
resources :resultats
resources :actualites

post 'votes/new'


end
