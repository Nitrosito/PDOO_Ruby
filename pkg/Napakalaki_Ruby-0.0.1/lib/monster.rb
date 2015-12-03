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
  
  attr_reader :name, :combatLevel,:badconsequence
  
  def to_s
    "\n\nNombre Monstruo: #{@name} 
       Nivel Combate: #{@combatLevel}
       Buen Rollo #{@prize.to_s}
       Mal rollo: #{@badconsequence.to_s}" 
  end
  
  def getLevelsGained
    @prize.level
  end
    
  def getTreasuresGained
    @prize.treasures
  end
end


 
