Demo::Application.routes.draw do
  apipie

  scope :module => :v1, :path => '/api/v1' do
    resources :users, except: [:new, :edit] do
      resources :tweets, except: [:new, :edit]
      resources :addresses
      resources :comments
    end
  end
  
  scope :module => :v2, :path => '/api/v2' do
    resources :users, except: [:new, :edit] do
      resources :tweets, except: [:new, :edit]
    end
  end
end

# Using `rake routes` to see all routes of rails application
