# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiGame

class Monster
  def initialize(name, combatLevel, prize, badConsequence )
    @name = name
    @combatLevel = combatLevel
    @prize = prize
    @badconsequence = badConsequence
    @levelChangeAgainstCultistPlayer=0
  end
  
  attr_reader :name, :combatLevel,:badconsequence, :levelChangeAgainstCultistPlayer
  
  
  #por que peta?
  def self.newCultistMonster(name,combatLevel,prize,badConsequence,IC)
    new(name,combatLevel,prize,badConsequence,IC)
  end
  private_class_method:new
  
  public
  def getLevelsGained
    @prize.level
  end
    
  def getTreasuresGained
    @prize.treasures
  end
  
  
  def to_s
    "\n\nNombre Monstruo: #{@name} 
       Nivel Combate: #{@combatLevel}
       Buen Rollo #{@prize.to_s}
       Mal rollo: #{@badconsequence.to_s}" 
  end
  
  def getCombatLevelAgainstCultistPlayer
    return @combatLevel+@levelChangeAgainstCultistPlayer
  end
end

end
 
