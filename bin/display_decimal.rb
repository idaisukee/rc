require File.expand_path('../../lib/RevCal.rb', __FILE__)
time = Time.now
rc_time = RcTime.new(Time.now)
print rc_time.to_decimal
