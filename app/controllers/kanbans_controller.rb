class KanbansController < ApplicationController
  def show
    @work_flow = WorkFlow.first
  end

  def edit
    @work_flow = WorkFlow.first
  end
end
