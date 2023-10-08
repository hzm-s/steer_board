class ItemsController < ApplicationController
  def index
    @state_id = params[:state_id]
    @items = Item.all_by_state(State.from_id(@state_id))
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
end
