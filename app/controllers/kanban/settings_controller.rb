class Kanban::SettingsController < ApplicationController
  def show
    @work_flow = WorkFlow.find
  end
end
