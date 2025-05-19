class Pokemon
  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  def attack()
    p "#{@name} のこうげき！"
  end
  
  def name 
    @name
  end

  def change_name(new_name)
    if new_name == "unko"
      p "Not available" 
    else
      @name = new_name
    end
  end
end

pokemon = Pokemon.new("リザードン", "fire", "sky", 120)
pokemon.change_name("unko")
p pokemon.change_name("zenigame")
pokemon.attack


class Pikacyu < Pokemon
  def attack()
    super
    p "#{@name}の10万ボルト!"
  end
end

pika = Pikacyu.new("ピカチュウ", "fire", "sky", 120)
pika.attack
