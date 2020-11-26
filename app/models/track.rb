class Track < ApplicationRecord
    belongs_to :user 

    # creates but does not save tracks; tracks are visible in json format without being saved to database. 
    def self.new_from_spotify_track(spotify_track)
        @track = Track.new(
            spotify_id: spotify_track.id, 
            name: spotify_track.name,
            # artists: spotify_track.artists[0].name,
            image: spotify_track.album.images[0]["url"],
            preview: spotify_track.preview_url
        )
        render json: {track: @track, message: "new track made, not saved"}
    end

    def self.create_from_spotify_track(spotify_track)
        @track = self.new_from spotify_track(spotify_track)
        @track.save
        render json: {track: @track, message: "track saved successfully"}
    end 
end
