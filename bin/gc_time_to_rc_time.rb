require File.expand_path('~/src/rc/lib/RevCal.rb')
input = STDIN.readline
gc_time = Time.parse(input)
rc_time = RcTime.new(gc_time)
print rc_time.rc_date_part.to_a.join('.'), ' ', ( rc_time.rc_total_sec / (100 * 100) ).round(2)
