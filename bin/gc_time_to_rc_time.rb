require File.expand_path('../../lib/RevCal.rb', __FILE__)
input = STDIN.readline
gc_time = Time.parse(input)
rc_time = RcTime.new(gc_time)
print rc_time.rc_hour.to_s + '.' + rc_time.rc_min.to_s
