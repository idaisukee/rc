require File.expand_path('~/src/rc/lib/RevCal.rb')
input = STDIN.readline
gc_date = Date.parse(input)
rc_date = RevDate.fromGregorian(gc_date)
print rc_date.to_a.join('.')
