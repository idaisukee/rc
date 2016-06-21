require './RevCal'
a = Time.new
p a
b = RcTime.new(a)
p b
p b.rc_hour
p b.rc_min
p b.rc_sec
p b.to_jp
p b.to_decimal
