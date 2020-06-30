Rails.application.routes.draw do
  get 'registrations/update'
  devise_for :members, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'homepages#index'
  get 'maintenances', to:'homepages#maintenances'
  get 'repairs', to:'homepages#repairs'
  get 'about_us', to:'homepages#about_us'
  get 'deal', to: 'homepages#deal'
  get 'deals', to:'homepages#deals'
  get 'contact_us', to:'homepages#contact_us'
  get 'terms', to:'homepages#terms'
  get 'privacy', to:'homepages#privacy'
  get 'careers', to:'homepages#careers'
  get 'disclaimer', to:'homepages#disclaimer'
  get 'deals_form', to:'homepages#deals_form'
  

end









