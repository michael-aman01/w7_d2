class BandsController < ApplicationController
    before_action :set_band, only: [:show, :edit, :update, :destroy]

    def index
        @bands = Band.all
        render :index
    end

    def create
        @band = Band.new(band_params)
        if @band && @band.save
            redirect_to bands_url
        else
            render json: @band.errors.full_messages
        end
    end

    def new
        @band = Band.new
        render :new
    end

    def edit
    end

    def show
        @albums = Album.where(band_id: @band.id)
        render :show
    end

    def update
    end

    

    def destroy

        if @band && @band.destroy
            redirect_to bands_url
        else
            render json: "NO BAND"
        end

    end

    private
    def band_params
        params.require(:band).permit(:name)
    end




end
