class Kanban::StateComponent < ViewComponent::Base
  delegate :id, :name, to: :state

  def initialize(state:, work_flow:, can_add:)
    @state = state
    @work_flow = work_flow
    @can_add = can_add
  end

  def allow_src
    state.previous(work_flow)&.id
  end

  private

  attr_reader :state, :work_flow
end
