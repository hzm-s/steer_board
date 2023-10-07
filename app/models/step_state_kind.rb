class StepStateKind
  module PreBuffer
    class << self
      def number
        0
      end

      def previous_state_of(step, work_flow)
        step.last_state_of_previous(work_flow)
      end

      def next_state_of(step, work_flow)
        step.states.primary
      end
    end
  end

  module Primary
    class << self
      def number
        1
      end

      def previous_state_of(step, work_flow)
        step.states.pre_buffer || step.last_state_of_previous(work_flow)
      end

      def next_state_of(step, work_flow)
        step.states.post_buffer || step.first_state_of_next(work_flow)
      end
    end
  end

  module PostBuffer
    class << self
      def number
        2
      end

      def previous_state_of(step, work_flow)
        step.states.primary
      end

      def next_state_of(step, work_flow)
        step.first_state_of_next(work_flow)
      end
    end
  end

  CLASSES = { pre_buffer: PreBuffer, primary: Primary, post_buffer: PostBuffer }

  class << self
    def from_name(name)
      CLASSES[name]
    end

    def buffer_from_position(pos)
      from_name("#{pos}_buffer".to_sym)
    end

    def load(number)
      if number
        CLASSES.values.find { _1.number == number }
      end
    end

    def dump(obj)
      obj.number
    end
  end
end
