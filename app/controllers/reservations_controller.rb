class ReservationsController < ApplicationController
  before_action :ensure_logged_in
  before_action :load_reservation, except: [:create, :destroy]
  before_action :ensure_user_owns_reservation, only: [:edit, :update]

  def load_reservation
      @reservation = Reservation.find(params[:id])
    end

  def ensure_user_owns_reservation
    unless current_user == @reservation.user
      flash[:alert] = "You are not authorized to edit this reservation!"
      redirect_to new_session_url
    end
  end

  def edit
    @restaurant = @reservation.restaurant
  end

  def create
    @reservation = Reservation.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation.date = params[:reservation][:date]
    d = Date.parse(params[:reservation][:date])
    t = Time.parse(params[:reservation][:time_slot])
    @reservation.time_slot = Time.zone.local(d.strftime('%Y'), d.strftime('%m'), d.strftime('%d'), t.strftime('%H'), t.strftime('%M'))
    @reservation.party_size = params[:reservation][:party_size]
    @reservation.restaurant_id = params[:restaurant_id]
    @reservation.user_id = current_user.id
    if @reservation.save
      flash[:notice] = "Reservation is successfully created!"
      redirect_to restaurant_url(params[:restaurant_id])
    else
      render 'restaurants/show'
    end
  end



  def update

    @restaurant = @reservation.restaurant
    @reservation.date = params[:reservation][:date]
    d = Date.parse(params[:reservation][:date])
    t = Time.parse(params[:reservation][:time_slot])
    @reservation.time_slot = Time.zone.local(d.strftime('%Y'), d.strftime('%m'), d.strftime('%d'), t.strftime('%H'), t.strftime('%M'))
    @reservation.party_size = params[:reservation][:party_size]
    @reservation.restaurant_id = params[:restaurant_id]
    @reservation.user_id = current_user.id

    if @reservation.save
      flash[:notice] = "Reservation is successfully created!"
      redirect_to restaurant_path(@restaurant)
    else
      render :edit

    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "Reservation deleted!"
    redirect_to restaurant_url(params[:restaurant_id])

  end



end
