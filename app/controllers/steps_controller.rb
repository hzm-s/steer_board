class StepsController < ApplicationController
  def new
    @can_close = turbo_frame_request?
  end

  def show
    @step = Step.find(params[:id])
  end

  def edit
    @step = Step.find(params[:id])
  end

  def update
  end
end
