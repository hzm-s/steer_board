class WorkFlowsController < ApplicationController
  def show
    @work_flow = WorkFlow.find(params[:id])
    @step_id = params[:step_id] || @work_flow.steps.first.id
  end
end
