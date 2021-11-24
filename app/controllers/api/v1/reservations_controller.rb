class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = logged_in_user.reservations.includes(:item)
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
    @reservation.user_id = logged_in_user.id
    if @reservation.save
      render json: { success: ['Reservation saved'] }, status: :ok
    else
      render json: { errors: ['Reservation failed '] }, status: 400
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      render json: { success: ['Reservation deleted'] }, status: :ok
    else
      render json: { errors: ['Reservation delete failed '] }, status: 400
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:item_id, :start_date, :end_date)
  end
end
