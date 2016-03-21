require File.expand_path('../../lib/RevCal.rb', __FILE__)
input = STDIN.readline
gc_date = Date.parse(input)
rc_date = RevDate.fromGregorian(gc_date)
print rc_date.to_a.join('.')
