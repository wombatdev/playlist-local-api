class DactylsController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
        respond_to do |format|
            format.html
            format.json { render json: Dactyl.all }
        end

    end

    def create
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'

        @dactyl = Dactyl.new(dactyl_params)

        if @dactyl.save
            render json: @dactyl.to_json, status: :created
        else
            render json: @dactyl.errors, status: :unprocessable_entity
        end
    end

    private
    def dactyl_params
        params.require(:dactyl).permit(:name, :access_code, :songs_per_user, :location)
    end


end
