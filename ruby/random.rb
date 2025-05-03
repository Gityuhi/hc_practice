# 配列を用意する
# 配列をシャッフルし、3:3/2:4に分割するメソッドを定義する
# 引数としてランダムに2/3が渡されるようにする


group = ["A", "B", "C", "D", "E", "F"]

def random(group)
  num = [2, 3].sample
  group.shuffle!
  p group.shift(num).sort
  group.sort
end

p random(group)

# p [2, 3].sample

# def random(group)
#   group.shuffle!
#   num = [2, 3].sample
#   def team(num, group)
#     p group.shift(num).sort
#     group.sort
#   end
# end

# p random(group)
 
#   p group.shift(num.sample).sort
#   group.sort
# end

# p random(group)


# group.shuffle!
 
# p group.shift(num.sample).sort
# group.sort

# if num == [1]
#   group.shuffle!
#   p group.shift(2).sort
#   p group.sort
# else
#   group.shuffle!
#   p group.shift(3).sort
#   p group.sort
# end


# 考えられるのは
# 1.配列をはじめにぐちゃぐちゃにしてそれを分割するメソッドを定義する
# 2.mapメソッドとかで任意の配列要素をブロックに入れて二つの新しい配列を生成する(取得するインデックスをランダムにする)
# 3.それかそもそも配列をランダムで分割してくれるような組み込みメソッドが存在するか(この場合ドキュメントを見る練習になる)
# 
#パッとできないのは3/3で分ける場合と2/4で分ける場合の条件分岐がわからない。
#これすらもランダムでやるのかな？