require File.expand_path('../../lib/RevCal.rb', __FILE__)
input = STDIN.readline
gc_time = Time.parse(input)
rc_time = RcTime.new(gc_time)
print ( rc_time.rc_total_sec / (100 * 100) ).round(2)
