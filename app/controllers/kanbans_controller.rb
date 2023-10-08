class KanbansController < ApplicationController
  def show
    @work_flow = WorkFlow.first
  end
end
