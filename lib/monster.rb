# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
  require_relative "prize.rb"
  require_relative "bad_consequence.rb"
  require_relative "treasure_kind.rb"
class Monster
  def initialize(name, combatLevel, prize, badConsequence )
    @name = name
    @combatLevel = combatLevel
    @prize = prize
    @badconsequence = badConsequence
  end
  
  attr_accessor :name, :combatLevel 
  
  def to_s
    "Nombre Monstruo: #{@name} 
           Nivel Combate: #{@combatLevel}
           Buen Rollo: #{@prize.to_s}
           Mal rollo: #{@badconsequence.to_s}" 
  end
end

#Creando un monstruo #FIXME #TODO
 pChibithulhu = Prize.new(1,1)
 bcChibithulhu = BadConsequence.newLevelSpecificTreasures('Embobados con el
 lindo primigenio te descartas de tu casco visible', 0, 
 [TreasureKind::BOTHHANDS], nil)
 mimonstruo = Monster.new('Chibithulhu',2,pChibithulhu,bcChibithulhu)
 
puts mimonstruo.to_s
 
