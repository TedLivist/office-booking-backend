class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all
    render json: @items
  end

  def show
    item_id = params["id"]
    @item = Item.find(item_id)
    render json: @item
  end
end
