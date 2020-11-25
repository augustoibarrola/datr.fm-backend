class AlbumsController < ApplicationController

    def index 
        @albums = Album.all
        render json: {albums: @albums, message: "Albums Index"}
    end

    def create 
        @album = Album.create(user_id: params[:user_id], name: params[:name], artist_name: params[:artist_name], image_url: params[:image_url])

        if @album.save 
            render json: { album: @album, message: 'favorite album successfully created'}
        end

    end

    private 

    def albums_params 
        params.require(:albums).permit(:user_id, :name, :artist_name, :image_url)
    end

end
# create_table "albums", force: :cascade do |t|
#     t.bigint "user_id"
#     t.string "name"
#     t.string "artist_name"
#     t.string "image_url"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["user_id"], name: "index_albums_on_user_id"
#   end

