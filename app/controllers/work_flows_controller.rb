class WorkFlowsController < ApplicationController
  def show
    @work_flow = WorkFlow.find(params[:id])
  end
end
