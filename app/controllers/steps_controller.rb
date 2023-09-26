class StepsController < ApplicationController
  def new
    @can_close = turbo_frame_request?
  end
end
