class ItemsController < ApplicationController
  def index
    @state_id = params[:state_id]
    @items = Item.all_by_state(@state_id)
  end
end
