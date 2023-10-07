class StepsController < ApplicationController
  def new
    @can_close = turbo_frame_request?
  end

  def show
    @step = Step.find(params[:id])
  end
end
