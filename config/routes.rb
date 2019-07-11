Rails.application.routes.draw do
  resources :tuples, except: [:new, :edit, :show, :index]
  resources :my_tables, except: [:new, :edit, :show, :index]
  resources :my_projects, except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'my_projects#index'

  #tables
  get 'my_projects/:id_project/new_table', to: 'my_tables#new', as: 'add_table'
  get 'my_projects/:id_project/edit_table/:id', to: 'my_tables#edit', as: 'edit_table'
  get 'my_projects/:id_project/show_table/:id', to: 'my_tables#show', as: 'table'

  #tuples
  get 'my_projects/:id_project/:id_table/new_tuple', to: 'tuples#new', as: 'add_tuple'
  get 'my_projects/:id_project/:id_table/edit_table/:id', to: 'tuples#edit', as: 'edit_tuple'
  get 'my_projects/:id_project/:id_table/:id', to: 'tuples#show', as: 'show_tuple'

end
