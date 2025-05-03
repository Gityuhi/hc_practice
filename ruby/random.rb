group = ["A", "B", "C", "D", "E", "F"]

# def random(group)
#   group.shuffle!
#   p group.shift(2).sort
#   p group.sort
# end

# random(group)

num = [0, 1]
num.shuffle!
num.shift(1)

if num == [1]
  group.shuffle!
  p group.shift(2).sort
  p group.sort
else
  group.shuffle!
  p group.shift(3).sort
  p group.sort
end



# 考えられるのは
# 1.配列をはじめにぐちゃぐちゃにしてそれを分割するメソッドを定義する
# 2.mapメソッドとかで任意の配列要素をブロックに入れて二つの新しい配列を生成する(取得するインデックスをランダムにする)
# 3.それかそもそも配列をランダムで分割してくれるような組み込みメソッドが存在するか(この場合ドキュメントを見る練習になる)
# 
#パッとできないのは3/3で分ける場合と2/4で分ける場合の条件分岐がわからない。
#これすらもランダムでやるのかな？