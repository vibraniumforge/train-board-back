Rails.application.routes.draw do
  root 'welcome#index'
  namespace :api do
    namespace :v1 do
      resources :trains  
      get '/amtrak-station/:id', to: "trains#amtrak_station"
      get '/amtrak-station-search/:id', to: "trains#amtrak_station_search"
      get '*path', to: "application#fallback_index_html", constraints: ->(request) do
        !request.xhr? && request.format.html?
      end
    end
  end
end
