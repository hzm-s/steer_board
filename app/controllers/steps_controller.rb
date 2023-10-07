class StepsController < ApplicationController
  def new
    @can_close = turbo_frame_request?
  end

  def show
    @step = WorkFlow.find.steps.find { _1.id == params[:id] }
  end
end
