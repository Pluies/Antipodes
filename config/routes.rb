Antipodes::Application.routes.draw do

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'

  root :to => 'places#index'
  match 'geocode' => 'places#geocode'
  match 'antipodes' => 'places#antipodes'
  match 'country' => 'countries#show'
  match 'country/antipodes' => 'countries#antipodes'

end
