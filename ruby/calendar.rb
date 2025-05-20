require 'date'
require 'optparse'

opt = OptionParser.new

opt.on("-m") {|v| v} 

month_optional = opt.parse!(ARGV).map(&:to_i)[0]

today = Date.today
year = today.year
month = month_optional || today.month
abort "#{ARGV} is neither a month number (1..12) nor a name" unless (1..12).include?(month)

first = Date.new(year, month, 1)
last = Date.new(year, month, -1)

first_wday = first.wday

white = Array.new((first_wday + 6) % 7 , " ")

range = white + (first..last).map { |date| date.strftime('%-d')}

puts "#{month}月 #{today.year}".center(20)

puts ["月", "火", "水", "木", "金", "土", "日"].map {|d| d.rjust(2)}.join


range.each_slice(7) do |n|
  puts n.map {|a| a.to_s.rjust(3)}.join
end

 



