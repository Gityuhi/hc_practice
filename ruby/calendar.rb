require 'date'
require 'optparse'

opt = OptionParser.new

opt.on("-m") {|v| v} 

month_optional = opt.parse!(ARGV).map(&:to_i)[0]

today = Date.today
year = today.year
month = month_optional || today.month
abort "#{ARGV} is neither a month number (1..12) nor a name" unless (1..12).include?(month)

last = Date.new(year, month, -1)
first = Date.new(year, month, 1)

first_wday = first.wday

white = Array.new((first_wday + 6) % 7 , " ")


range = white + (1..last.day).to_a

def calendar(range)
range.each_slice(7) do |n|
  puts n.map {|a| a.to_s.rjust(3)}.join
end
end

puts "#{month}月 #{today.year}".center(20)

puts ["月", "火", "水", "木", "金", "土", "日"].map {|d| d.rjust(2)}.join

calendar(range)
 


