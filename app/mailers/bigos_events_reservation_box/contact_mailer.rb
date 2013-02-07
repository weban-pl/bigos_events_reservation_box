module BigosEventsReservationBox
class ContactMailer < ActionMailer::Base


  def custom_message(msg = nil)
    if msg != nil
      @message = msg
      @event_option = BigosEventsBox::EventOption.find(@message.event_option_id)
      mail(:to => BigosEventsReservationBox::Setting["#{BigosEventsReservationBox.name}.recipient"],
           :from => BigosEventsReservationBox::Setting["GS.mailer_user_name"], :subject => "Reservation: #{@message.reservation_name}")
    end
  end
  end
end
