Antipodes::Application.routes.draw do

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'

  root :to => 'antipodes#show'
  match 'geocode' => 'antipodes#address'
  match 'antipodes' => 'antipodes#reverse'

end
