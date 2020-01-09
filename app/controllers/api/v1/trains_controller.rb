module Api::V1
  class TrainsController < ApplicationController

    before_action :find_train, only: [:show, :edit, :update, :destroy]

    def index
      @trains = Train.all
      render json: { message: "Trains successfully returned.", success: true, data: @trains }, status: 200
      # doesnt work
      # render json: { message: "Trains successfully returned.", success: true, data: @trains, only: [:destination, :origin, :remarks_boarding, :service, :trainno, :scheduled, :scheduled24, :newtime, :newtime24] }, status: 200
      # works
      # render json: @trains, only: [:destination, :origin, :remarks_boarding, :service, :trainno, :scheduled, :scheduled24, :newtime, :newtime24]
    end

    def show
      if @train.nil?
        puts "Train not found"
        render json: { message: "Train NOT found.", success: false, data: @train.errors.full_messages }, status: 406
      else
        puts "success"
        render json: { message: "Train successfully returned.", success: true, data: @train }, status: 200
      end
    end

    def new
    end

    def create
      @train = Train.new(train_params)
      if @train.save && @train.valid?
        puts "=> train saved"
        render json: { message: "Train successfully saved.", success: true, data: @train }, status: 200
      else
        puts "Train not saved"
        puts "Errors= #{@train.errors.full_messages.join(", ")}"
        render json: { message: "Train NOT saved because #{@train.errors.full_messages.join(", ")}", success: false, data: @train.errors.full_messages }, status: 406
      end
    end
        
    def edit
    end

    def update
      if @train.nil?
        puts "Train not found"
        render json: { message: "Train not found", success: false }, status: 406
      end
      if @train.update(train_params) && @train.valid?
        puts "Train updated"
        render json: { message: "Train successfully saved.", success: true, data: @train }, status: 200
      else
        puts "Train not saved"
        render json: { message: "Train NOT updated because #{@train.errors.full_messages.join(", ")}", success: false, data: @train.errors.full_messages }, status: 406
        puts "Errors= #{@train.errors.full_messages.join(", ")}"
      end
    end
    
    def destroy
      if @train.destroy
        render json: { message: "Train successfully deleted.", success: true, data: @train }, status: 200
      else
        render json: { message: "Train NOT successfully deleted.", success:false, data: @train.errors.full_messages.join(", ") }, status: 406
        puts "Error in delete: #{@train.errors.full_messages.join(", ")}"
      end
    end

    def amtrak_station
      response = Faraday.get("http://dixielandsoftware.net/Amtrak/solari/data/#{params[:id]}_schedule.php?data=#{params[:id]}") 
      body = JSON.parse(response.body)
      if response.success? 
        @trains = body["response"]
        render json: {message: "Amtrak info found.", success: true, data: @trains}, status: 200
      else 
        render json: {message: "Amtrak info not found.", success:false, data: @train.errors }, status: 406
      end
    end

    def amtrak_station_search
      response = Faraday.get("http://www.dixielandsoftware.net/cgi-bin/station_search.pl?data=#{params[:id]}") 
      if response.success? 
        @stations = response.body
        # render json: {message: "Amtrak info found.", success: true, data: @stations }, status: 200
        render plain: @stations
      else 
        render json: {message: "Amtrak info not found.", success:false, data: @stations.errors.full_messages }, status: 406
      end
    end

    private

    def find_train
      @train = Train.find_by(id: params[:id])
    end

    def train_params
      params.require(:train).permit(:destination, :newtime, :newtime24, :origin, :remarks_boarding, :scheduled, :scheduled24, :service, :trainno)
    end

  end
end