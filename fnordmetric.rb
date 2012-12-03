require "fnordmetric"

FnordMetric.namespace :finvorkurs do

  hide_overview
  hide_active_users

  toplist_gauge :popular_urls, title: "Popular URLs"

  gauge :visits, tick: 1.minute
  widget "Visits",
    title: "Visits per Minute",
    type: :timeline,
    width: 100,
    gauges: :visits,
    include_current: true,
    autoupdate: 60

  event :visit do
    observe :popular_urls, data[:url]
    incr :visits
  end

end

FnordMetric::Web.new port: 4242
FnordMetric::Worker.new
FnordMetric.run
