class TracksController < ApplicationController
    
    def index 
        @tracks = Track.all 
        render json: { tracks: @tracks, message: "tracks index" }
    end

    def show 
        # @track = Track.find_by(id: params[:id])
        # render json: { track: @track, message: "track show" }
        s_tracks = RSpotify::Playlist.find("2percentskimilk", "6PRi4AGpC4FpN0NwgncE9W").tracks
        @tracks = s_tracks.map do | s_track |
            Track.new_from_spotify_track(s_track)
        end

        render json: {tracks: TrackSerializer.new(@tracks), message: "top 100"}
    end


    def top_100 
        # s_tracks = RSpotify::Playlist.find("user_id", "playlist_id")
        s_tracks = RSpotify::Playlist.find("2percentskimilk", "6PRi4AGpC4FpN0NwgncE9W").tracks
        @tracks = s_tracks.map do | s_track |
            Track.new_from_spotify_track(s_track)
        end

        render json: {tracks: @tracks, message: "top 100"}
    end


    def search 
        s_tracks = RSpotify::Track.search(params[:q])
        @tracks = s_tracks.map do | s_track |
            Track.new_from_spotify_track(s_track)
        end
        render json: { tracks: @tracks }
    end
end
