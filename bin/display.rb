require File.expand_path('../../lib/RevCal.rb', __FILE__)
time = Time.now
rc_time = RcTime.new(Time.now)
print rc_time.rc_date_part.to_a.join('.'), ' ', (rc_time.rc_total_sec / (100 * 100)).round(2)
