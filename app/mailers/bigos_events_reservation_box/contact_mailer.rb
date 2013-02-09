module BigosEventsReservationBox
class ContactMailer < ActionMailer::Base


  def custom_message(msg = nil)
    if msg != nil
      @message = msg
      @event_option = BigosEventsBox::EventOption.find(@message.event_option_id)
      mail(:to => BigosEventsReservationBox::Setting["#{BigosEventsReservationBox.name}.recipient"],
           :from => "kremenso@o2.pl",
           :'reply-to'=> "kremenso@o2.pl",
           :subject => "Reservation: #{@message.reservation_name}")
    end
  end
  end
end
