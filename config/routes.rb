Antipodes::Application.routes.draw do

  # Sample of regular route:
  #   get 'products/:id' => 'catalog#view'

  root :to => 'places#index'
  get 'geocode' => 'places#geocode'
  get 'antipodes' => 'places#antipodes'
  get 'country' => 'countries#show'
  get 'country/antipodes' => 'countries#antipodes'

end
