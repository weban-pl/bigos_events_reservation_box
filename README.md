## BigosEventsReservationBox
Widget with events reservation form.

## Installation

BigosContactBox works with Rails 3.1 onwards. You can add it to your Gemfile with:

```ruby
gem "bigos_events_reservation_box", :git=>"git://github.com/weban/bigos_events_reservation_box.git"

```
Gems "jquery-rails", "bigos_events_box" and "bigos_settings" are required

Run the bundle command to install it.

After you install BigosEventsReservationBox and add it to your Gemfile, you need to run the generator:

```console
rails generate bigos_events_reservation_box:install
```

If You want displaying message after send email You have to add this line in view after redirect:

```ruby
<%= flash[:notice] unless flash[:notice].blank? %>
```


## Configuration

Please set generated settings

## Customization

You can use to generate view you can overwrite
```console
rails generate bigos_events_reservation_box:views
```