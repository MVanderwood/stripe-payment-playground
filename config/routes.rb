Rails.application.routes.draw do
  get 'transactions/new'

  get 'transactions/create'

  get 'product/show'

  get 'product/index'

  get 'product/new'

  get 'product/create'

  get 'product/edit'

  get 'product/update'

  get 'product/delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
