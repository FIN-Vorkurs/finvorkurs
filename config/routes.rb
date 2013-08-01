require 'gollum/frontend/app'

FinVorkurs::Application.routes.draw do

  scope ENV['RAILS_RELATIVE_URL_ROOT'] || '/' do

    root :to => 'users#new'

    get "logout" => "sessions#destroy", :as => "logout"
    get "login" => "sessions#new", :as => "login"
    get "signup" => "users#new", :as => "signup"
    get "legal" => "legal#index", :as => "legal"

    resources :users, 
              :sessions, 
              :password_resets, 
              :posts,
              :logs,
              :schedules,
              :downloads

    resources :courses do
      resources :enrollments
      resources :tests
      resources :replies
      resources :questions do
        resources :answers
      end
    end

    Precious::App.set(:gollum_path, "/home/git/vorkurs_wiki.git")
    Precious::App.set(:default_markup, :markdown)
    Precious::App.set(:wiki_options, {:universal_toc => false})
    mount Precious::App, at: 'wiki'

    begin
      ActiveAdmin.routes(self)
    rescue Exception => e
      puts "ActiveAdmin: #{e.class}: #{e}"
    end

  end
end
