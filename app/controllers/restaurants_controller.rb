class RestaurantsController < ApplicationController
  before_action :ensure_logged_in,except: [:show, :index ]
  before_action :ensure_user_owns_restaurant, only: [:edit, :update, :destroy]

  def ensure_user_owns_restaurant
      @restaurant = Restaurant.find_by_owner(current_user.id)
    unless @restaurant != nil
      flash[:alert] = "You are not authorized to edit this restaurant!"
      redirect_to new_session_url
    end
  end

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
      @restaurant.open_hour = params[:restaurant][:open_hour].in_time_zone('EST')
      @restaurant.close_hour = params[:restaurant][:close_hour].in_time_zone('EST')
      @restaurant.neighborhood = params[:restaurant][:neighborhood]
      @restaurant.price_range = params[:restaurant][:price_range]
      @restaurant.menu = params[:restaurant][:menu]
      @restaurant.summary = params[:restaurant][:summary]
      @restaurant.pic_url = params[:restaurant][:pic_url]
      @restaurant.owner = current_user.id
      if @restaurant.save
        flash[:notice] = "Restaurant is successfully created!"
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
      @restaurant.open_hour = params[:restaurant][:open_hour]
      @restaurant.close_hour = params[:restaurant][:close_hour]
      @restaurant.neighborhood = params[:restaurant][:neighborhood]
      @restaurant.price_range = params[:restaurant][:price_range]
      @restaurant.menu = params[:restaurant][:menu]
      @restaurant.summary = params[:restaurant][:summary]
      @restaurant.pic_url = params[:restaurant][:pic_url]
      @restaurant.owner = current_user.id
      if @restaurant.save
        flash[:notice] = "Restaurant is successfully updated!"
        redirect_to restaurant_url(@restaurant)
      else
        render :new
      end
    end


    def destroy
      @restaurant = Restaurant.find(params[:id])
      @restaurant.destroy
      flash[:notice] = "Restaurant deleted!"
      redirect_to root_url

    end


  end
