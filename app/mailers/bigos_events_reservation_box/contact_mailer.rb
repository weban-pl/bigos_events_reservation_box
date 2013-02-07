module BigosEventsReservationBox
class ContactMailer < ActionMailer::Base


  def custom_message(msg = nil)
    if msg != nil
      @message = msg
      @party_option = BigosEventsBox::EventOption.find(@message.event_option_id)
      mail(:to => BigosEventsReservationBox::Setting["#{BigosEventsReservationBox.name}.recipient"],
           :from => BigosEventsReservationBox::Setting["GS.mailer_user_name"], :subject => @message.subject)
    end
  end
  end
end
