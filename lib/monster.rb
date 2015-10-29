# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

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
       Buen Rollo #{@prize.to_s}
       Mal rollo: #{@badconsequence.to_s}" 
  end
end


 
