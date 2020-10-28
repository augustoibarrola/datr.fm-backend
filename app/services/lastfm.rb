module Lastfm
    class Search 
        def self.by_location(location)
        Faraday.get 'http://www.last.fm/api/auth/?api_key=' + ENV['LASTFM_KEY']
        end
    end
end