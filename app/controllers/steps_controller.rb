class StepsController < ApplicationController
  def new
    @can_close = turbo_frame_request?
  end

  def edit
    @step = Step.find(params[:id])
  end
end
