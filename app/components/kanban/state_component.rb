class Kanban::StateComponent < ViewComponent::Base
  include UiBoardHelper

  delegate :id, :name, to: :state

  def initialize(state:, work_flow:, initial:)
    @state = state
    @work_flow = work_flow
    @initial = initial
  end

  def allow_src
    state.previous(work_flow)&.id
  end

  private

  attr_reader :state, :work_flow
end
