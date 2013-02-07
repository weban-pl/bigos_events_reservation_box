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
        Setting["GS.use_widget_mailer_settings"] = false if Setting.find_by_var("GS.use_widget_mailer_settings").blank?
        Setting["GS.mailer_port"] = 587 if Setting.find_by_var("GS.mailer_port").blank?
        Setting["GS.mailer_domain"] = "yourdomain.dev" if Setting.find_by_var("GS.mailer_domain").blank?
        Setting["GS.mailer_address_name"] = "smtp.gmail.com" if Setting.find_by_var("GS.mailer_address_name").blank?
        Setting["GS.mailer_user_name"] = "from@yourdomain.dev" if Setting.find_by_var("GS.mailer_user_name").blank?
        Setting["GS.mailer_password"] = "Super-Secure-Password" if Setting.find_by_var("GS.mailer_password").blank?
        Setting["#{BigosEventsReservationBox.name}.recipient"] = "Your email address" if Setting.find_by_var("#{BigosEventsReservationBox.name}.recipient").blank?
        Setting["#{BigosEventsReservationBox.name}.invalid_fields_error"] = "Invalid Fields" if Setting.find_by_var("#{BigosEventsReservationBox.name}.invalid_fields_error").blank?
        Setting["#{BigosEventsReservationBox.name}.success_message"] = "Message sent successfully" if Setting.find_by_var("#{BigosEventsReservationBox.name}.success_message").blank?
        Setting["#{BigosEventsReservationBox.name}.redirect_path"] = "" if Setting.find_by_var("#{BigosEventsReservationBox.name}.redirect_path").blank?
        im = BigosApp::InstalledModule.find_or_create_by_name(BigosEventsReservationBox.name)
        im.page_element =  BigosApp::BigosEventsReservationBoxElement.name
        im.save
      end

    end
  end
end
