module BigosApp
  class BigosEventsReservationBoxElement < PageElement

    def self.class_name
      "Events reservation module"
    end

    def render
      "bigos_events_reservation_box/module/item"
    end

    def admin_render
      nil
    end

  end
end
