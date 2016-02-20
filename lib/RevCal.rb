# coding: utf-8
require 'date'
require 'yaml'
class RevDate
  attr_reader :year, :month, :day

  NAMES_FILE = File.expand_path('~/src/rc/lib/month_names.yml')
  File.open(NAMES_FILE) do |file|
    NAMES = YAML::load(file)
  end

  SYMBOLS_FILE = File.expand_path('~/src/rc/lib/day_symbols.yml')
  File.open(SYMBOLS_FILE) do |file|
    SYMBOLS = YAML::load(file)
  end


  # create new RevDate with given year, month, day (numeric, using revolutionary year, month, day)
  def initialize(year, month, day)
    @year = year
    @month = month
    @day = day
  end
  # create human readable string of date
  def to_s 
    s = ""
    s += @day.to_s + " " + NAMES[@month - 1] + " " + @year.to_s
  end
  def to_a
    [@year, @month, @day]
  end
  def self.leapYearInRomme?(year)
    if (year == 3 || year == 7 || year == 11 || year == 15 || year == 20)
      return true
    elsif (year > 20 && (year % 4 == 0 && (year % 100 > 0) || year % 400 == 0))
      return true
    else
      return false
    end
  end
  # return number of days in given revolutionary year
  def self.length(year)
    if leapYearInRomme?(year)
      return 366
    else
      return 365
    end
  end
  # convert the despised reactionary date of the ancien regime to our glorious rational format
  def self.fromGregorian(d)
    start = Date.new(1792,9,22)
    days = d - start
    year = 1
    month = 1
    while (days >= yearLen = RevDate.length(year))
      days -= yearLen
      year += 1
    end
    month = (1 + (days / 30)).to_i
    day = (1 + (days % 30)).to_i
    return RevDate.new(year, month, day)
  end
  def past_days
    year = self.year
    month = self.month
    day = self.day

    past_days = 0
    past_years = Range.new(1, year - 1)
    past_years.each do |past_year|
      past_days += RevDate.length(past_year)
    end
    past_days += 30 * (month - 1)
    past_days += day - 1
  end
  def to_gc
    start = Date.new(1792,9,22)
    past_days = self.past_days
    gc = start + past_days
  end
  #return the date's symbol (associated plant, animal, or tool)
  def daySymbol
    dayNum = 30*(@month - 1) + (@day - 1)
    return SYMBOLS[dayNum]
  end
end

class RcTime
attr_reader :date_part
  def initialize(gc_time)
    @gc_time = gc_time
    @date_part = Date.new(@gc_time.year, @gc_time.month, @gc_time.day)
  end
end
