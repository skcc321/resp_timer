require "resp_timer/railtie"

module RespTimer
  module ControllerPatch
    extend ActiveSupport::Concern

    included do
      if Rails.env.development?
        before_action :start_count
        after_action :end_count
      end

      @@timestamps = {}

      def start_count
        @@timestamps[resp_timer_key] = Time.current
      end

      def end_count
        Rails.logger.info
      end

      def resp_timer_key
        [self.class.name, self.action_name].join('#')
      end

      def resp_timer_delta
        Time.current - @@timestamps[resp_timer_key]
      end

      def resp_message
        left_part = resp_timer_key.black
        mid_part = "================>".gray

        right_part = if resp_timer_delta > 1
                       "#{resp_timer_delta}".red
                     else
                       "#{resp_timer_delta}".yellow
                     end

        [left_part, mid_part, right_part, 'sec'].join(' ')
      end
    end
  end
end

ActionController::Base.send :include, RespTimer::ControllerPatch
