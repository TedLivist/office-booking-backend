class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = User.find_by(username: params[:username]).reservations.includes(:item)
    render json: {
      reservations:
        @reservations.map do |reservation|
          {
            id: reservation.id,
            item_id: reservation.item_id,
            start_date: reservation.start_date,
            end_date: reservation.end_date,
            item: {
              id: reservation.item.id,
              name: reservation.item.name,
              location: reservation.item.location,
              image: reservation.item.image
            }
          }
        end
    }.to_json
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = User.find_by(username: params[:username]).id
    if @reservation.save
      render json: { success: ['Reservation saved'] }
    else
      render json: { errors: ['Reservation failed '] }
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      render json: { success: ['Reservation deleted'] }
    else
      render json: { errors: ['Reservation delete failed '] }
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:item_id, :start_date, :end_date)
  end
end
