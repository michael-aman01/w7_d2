class AlbumsController < ApplicationController
    before_action :set_band

    def new
        @album = Album.new(band_id: params[:band_id])
        render :new
    end

    def create

       @album = Album.new(album_params)
        @band = Band.find_by(id: params[:album][:band_id])
        if @album && @album.save
            redirect_to band_url(@band)
        else
            render json: @album.errors.full_messages
        end
    end

    def edit
        @album = Album.find_by(id: params[:id])
        render
    end

    def show
        @album = Album.find_by(id: params[:id])
        if @album
            render :show
        else
            redirect_to band_url(@album.band) #check this
        end
    end

    def update(album)
        if album.update
            redirect_to album_url(album) 
        end
    end

    def destroy
    end

    def album_params
        params.require(:album).permit(:title, :band_id, :year, :studio_album?)
    end


end
