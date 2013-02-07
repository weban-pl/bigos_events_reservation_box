module BigosEventsReservationBox
  module Controllers
    module Helpers
      extend ActiveSupport::Concern

      def bigos_events_reservation_box_widget (events_options)

        if Setting["GS.use_widget_mailer_settings"]
          ActionMailer::Base.delivery_method = :smtp
          ActionMailer::Base.raise_delivery_errors = true
          ActionMailer::Base.perform_deliveries = true
          ActionMailer::Base.default :charset => "utf-8"
          ActionMailer::Base.default_url_options = { :host => Setting["GS.mailer_domain"] }

          ActionMailer::Base.smtp_settings = {
            :address              => Setting["GS.mailer_address_name"].to_s,
            :port                 => Setting["GS.mailer_port"].to_i,
            :user_name            => Setting["GS.mailer_user_name"].to_s,
            :password             => Setting["GS.mailer_password"].to_s,
            :authentication       => "plain",
            :enable_starttls_auto => true,
            :domain               => Setting["GS.mailer_domain"].to_s
          }
        end
        @message = BigosEventsReservationBox::Message.new
        @events_options = events_options
        render :partial=>"bigos_events_reservation_box/module/widget", :locals=> {
            :message => @message, :events_options => @events_options }
      end
    end
  end
end
