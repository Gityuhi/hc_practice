##gitの修正のために変更を加えた←このコメント
pars = gets.chomp.split(",").map(&:to_i)
strokes = gets.chomp.split(",").map(&:to_i)

pairs = pars.zip(strokes).map do |par, stroke| 
  diff = par - stroke
  if par == 5 && stroke == 1
    "コンドル"
  elsif par == 5 && stroke == 2
    "アルバトロス"
  elsif stroke == 1
    "ホールインワン"
  elsif  diff < -1 then "#{diff.abs}ボギー"
  else
    case diff
      when 0 then "パー"
      when 1 then "バーディ"
      when 2 then "イーグル"
      when 3 then "アルバトロス"
      when 4 then "コンドル"
      when -1 then "ボギー"
    end
  end
end

puts pairs.join(",")
