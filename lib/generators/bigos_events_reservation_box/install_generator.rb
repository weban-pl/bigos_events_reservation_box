module BigosEventsReservationBox
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a EventsReservation initializer."
      def copy_initializer
        template "bigos_events_reservation_box.rb", "config/initializers/bigos_events_reservation_box.rb"
      end

      def include_js
        insert_into_file "app/assets/javascripts/application.js", :after => %r{//= require +['"]?jquery_ujs['"]?} do
		      "\n//= require 'bigos_events_reservation_box/bigos_events_reservation_box'"
		    end
      end

      def include_routes
        route 'mount BigosEventsReservationBox::Engine => "/bigos_events_reservation_box"'
      end

      def create_settings
        Setting["GS.use_widget_mailer_settings"] = false
        Setting["GS.mailer_port"] = 587
        Setting["GS.mailer_domain"] = "yourdomain.dev"
        Setting["GS.mailer_address_name"] = "smtp.gmail.com"
        Setting["GS.mailer_user_name"] = "from@yourdomain.dev"
        Setting["GS.mailer_password"] = "Super-Secure-Password"
        Setting["#{BigosEventsReservationBox.name}.recipient"] = "Your email address"
        Setting["#{BigosEventsReservationBox.name}.invalid_fields_error"] = "Invalid Fields"
        Setting["#{BigosEventsReservationBox.name}.success_message"] = "Message sent successfully"
        Setting["#{BigosEventsReservationBox.name}.redirect_path"] = ""
        im = BigosApp::InstalledModule.find_or_create_by_name(BigosEventsReservationBox.name)
        im.page_element =  BigosApp::BigosEventsReservationBoxElement.name
        im.save
      end

    end
  end
end
