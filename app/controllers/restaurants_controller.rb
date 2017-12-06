class RestaurantsController < ApplicationController

    def index
      @restaurants = Restaurant.all
    end

    def new
      @restaurant = Restaurant.new
    end

    def create
      @restaurant = Restaurant.new
      @restaurant.name = params[:restaurant][:name]
      @restaurant.address = params[:restaurant][:address]
      @restaurant.capacity = params[:restaurant][:capacity]
      if @restaurant.save
        flash[:notice] = "restaurant is successfully created!"
        redirect_to restaurants_url
      else
      render :new
      end
    end



    def edit
      @restaurant = Restaurant.find(params[:id])
    end

    def show
      @restaurant = Restaurant.find(params[:id])
      @reservation = @restaurant.reservations.build

    end

    def update
      @restaurant = Restaurant.find(params[:id])
      @restaurant.name = params[:restaurant][:name]
      @restaurant.address = params[:restaurant][:address]
      @restaurant.capacity = params[:restaurant][:capacity]

      if @restaurant.save
        flash[:notice] = "restaurant is successfully updated!"
        redirect_to restaurants_url
      else
        render :new
      end
    end


    def destroy
      @restaurant = Restaurant.find(params[:id])
      @restaurant.destroy
      flash[:notice] = "restaurants deleted!"
      redirect_to root_url

    end


  end
