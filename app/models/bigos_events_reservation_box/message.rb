module BigosEventsReservationBox
  class Message

    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    attr_accessor :event_option_id, :date_of_party, :end_time, :arrival_time, :reservation_name, :number_in_party, :contact_number

    validates :event_option_id, :date_of_party, :end_time, :arrival_time, :reservation_name, :number_in_party, :contact_number, :presence => true


    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def persisted?
      false
    end

  end
end