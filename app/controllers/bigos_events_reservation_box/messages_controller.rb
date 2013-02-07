module BigosEventsReservationBox
  class MessagesController < ActionController::Base

    def create
      @message = Message.new(params[:message])
      if @message.valid?
        ContactMailer.custom_message(@message).deliver
        redirect_to(Setting["#{BigosEventsReservationBox.name}.redirect_path"].blank? ? main_app.root_path: Setting["#{BigosEventsReservationBox.name}.redirect_path"],
                    :notice => Setting["#{BigosEventsReservationBox.name}.success_message"])
      else
        flash.now.alert = Setting["#{BigosEventsReservationBox.name}.invalid_fields_error"]
        render partial: "bigos_events_reservation_box/module/widget"
      end
    end

    def index
      @message = Message.new(params[:message])

      if @message.valid?
        render text: true.to_json
      else
        render text: @message.errors.to_json
      end
    end

  end
end