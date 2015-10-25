# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Monster
  def initialize(name, combatLevel, prize, badConsecuence )
    @name = name
    @combatLevel = combatLevel
    @prize = prize
    @badconsecuence = badConsecuence
  end
  
  attr_accessor :name, :combatLevel
  
  def to_s
    "Nombre Monstruo: #{name} \n
           Nivel Combate: #{combatLevel}\n
           Buen Rollo: #{prize}\n
           Mal rollo: #{badconsequence.to_s}"
  end
end
