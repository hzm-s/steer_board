class StateKind
  module PreQueue
    class << self
      def previous_state_of(step, work_flow)
        step.last_state_of_previous(work_flow)
      end

      def next_state_of(step, work_flow)
        step.states.primary
      end

      def name
        'Todo'
      end

      def to_s
        'pre_queue'
      end
    end
  end

  module Primary
    class << self
      def previous_state_of(step, work_flow)
        step.states.pre_queue || step.last_state_of_previous(work_flow)
      end

      def next_state_of(step, work_flow)
        step.states.post_queue || step.first_state_of_next(work_flow)
      end

      def name
        'WIP'
      end

      def to_s
        'primary'
      end
    end
  end

  module PostQueue
    class << self
      def previous_state_of(step, work_flow)
        step.states.primary
      end

      def next_state_of(step, work_flow)
        step.first_state_of_next(work_flow)
      end

      def name
        'Done'
      end

      def to_s
        'post_queue'
      end
    end
  end

  CLASSES = { pre_queue: PreQueue, primary: Primary, post_queue: PostQueue }

  class << self
    def from_name(name)
      raise ArgumentError, "#{name} is invalid #{self}" unless CLASSES.has_key?(name.to_sym)

      CLASSES[name.to_sym]
    end
  end
end
