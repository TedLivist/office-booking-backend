class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all
    render json: @items
  end

  def show
    item_id = params[:id]
    @item = Item.find(item_id)
    render json: @item
  end

  def create
    @image = Cloudinary::Uploader.upload(items_params[:image])
    @item = Item.new(item_params)
    @item.image = @image['url']

    if @item.save
      render json: { success: 'Item saved' }
    else
      render json: { error: [ 'Unable to save item' ] }, status: 400
    end
  end

  def destroy
    @item_to_delete = Item.find(params[:id])

    if @item_to_delete.destroy
      @updated_items = Item.all
      render json: @updated_items
    else
      render json: { error: ['Item is not in storage or has been deleted'] }, status: 400
    end
  end

  private

  def item_params
    params.permit(:name, :location, :image, :description)
  end
end
