require File.expand_path('~/src/rc/lib/RevCal.rb')
gc_date = Date.parse(ARGV[0])
rc_date = RevDate.fromGregorian(gc_date)
print rc_date.to_a.join('.')
