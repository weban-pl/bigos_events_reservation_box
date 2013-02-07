require "bigos_events_reservation_box/engine"

module BigosEventsReservationBox
  module Controllers
    autoload :Helpers, 'bigos_events_reservation_box/controllers/helpers'
  end

  def self.setup
    include_helpers
    yield self
  end

  def self.include_helpers
    ActiveSupport.on_load(:action_controller) do
    end

    ActiveSupport.on_load(:action_view) do
      include BigosEventsReservationBox::Controllers::Helpers
    end
  end
end
