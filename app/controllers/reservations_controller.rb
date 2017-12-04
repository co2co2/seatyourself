class ReservationsController < ApplicationController
  before_action :ensure_logged_in
  before_action :load_reservation
  before_action :ensure_user_owns_reservation,only: [:edit, :update, :destroy]

  def load_reservation
      @reservation = reservation.find(params[:id])
    end

  def ensure_user_owns_reservation
    unless current_user == @reservation.user
      flash[:notice] = "you are not the right user!"
      redirect_to new_session_url
    end
  end

  def edit
    @reservation = reservation.find(params[:id])
    @restaurant = @reservation.restaurant
  end

  def create
    @reservation = reservation.new
    @restaurant = @reservation.restaurant
    @reservation.date = params[:reservation][:date]
    @reservation.party_size = params[:reservation][:party_size]
    @reservation.restaurant_id = params[:restaurant_id]
    @reservation.user_id = current_user.id
    if @reservation.save
      flash[:notice] = "reservation is successfully created!"
      redirect_to restaurant_url(@restaurants)
    else
      render :edit

    end
  end



  def update
    @reservation = reservation.find(params[:id])
    @restaurant = @reservation.restaurant
    @reservation.date = params[:reservation][:date]
    @reservation.party_size = params[:reservation][:party_size]
    @reservation.restaurant_id = params[:restaurant_id]
    @reservation.user_id = current_user.id
    if @reservation.save
      flash[:notice] = "reservation is successfully created!"
      redirect_to edit_reservation_url(@reservation)
    else
      render :edit

    end
  end

  def destroy
    @reservation = reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "reservation deleted!"
    redirect_to restaurant_url(@restaurants)

  end



end
