class RestaurantsController < ApplicationController

    # def task_params
    #   params.require(:task).permit(:name, :complete, :due_date, :term)
    # end


    def index
      # @restaurants = Restaurant.all
      if params[:search]
        @restaurants = Restaurant.search(params[:search]).order("created_at DESC")

      else
        @restaurants = Restaurant.all.order("created_at DESC")
      end
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
