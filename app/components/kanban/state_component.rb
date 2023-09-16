class Kanban::StateComponent < ViewComponent::Base
  include UiBoardHelper

  delegate :id, :name, to: :state

  def initialize(state:, work_flow:, has_sibling:)
    @state = state
    @work_flow = work_flow
    @has_sibling = has_sibling
  end

  def allow_src
    state.previous(work_flow)&.id
  end

  private

  attr_reader :state, :work_flow, :has_sibling
end
