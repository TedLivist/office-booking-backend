class V1::ReservationsController < ApplicationController
  def index
    @reservations = User.find_by(username: params[:username]).reservations
    render json: {
      reservations: @reservations
    }.to_json
  end
end
