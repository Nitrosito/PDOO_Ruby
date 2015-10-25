# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
  require_relative "prize.rb"
  require_relative "bad_consequence.rb"
  require_relative "monster.rb"
  require_relative "treasure_kind.rb"
class PruebaNapakalaki
  def initialize
    
  end
  
end

  # Probando a crear objetos de las clases creadas y consultarlos
   #mimonstruo = Monster.new("Tux", 100, Prize.new(10, 10), BadConsequence.new("meh",3,3,3,3,3,false)) # Creo objeto monstruo
   #puts mimonstruo.name #nombre
   #puts mimonstruo.combatLevel #Nivel

   #miprize = Prize.new(3, 3)
   #puts miprize.level 
   #puts miprize.treasures
   
#Creando un monstruo #FIXME #TODO
 pChibithulhu = Prize.new(1,1)
 bcChibithulhu = BadConsequence.newLevelSpecificTreasures("Embobados con el lindo primigenio te descartas de tu casco visible", 0,[TreasureKind::BOTHHANDS], nil)
 mimonstruo = Monster.new('Chibithulhu',2,pChibithulhu,bcChibithulhu)
 
puts mimonstruo.to_s