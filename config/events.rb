WebsocketRails::EventMap.describe do
  namespace :tweets do
    subscribe :send, 'tweets#new'
  end
end
