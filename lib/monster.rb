# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiGame

class Monster
  def initialize(name, combatLevel, prize, badConsequence, lc=0 )
    @name = name
    @combatLevel = combatLevel
    @prize = prize
    @badconsequence = badConsequence
    @levelChangeAgainstCultistPlayer=lc
  end
  
  attr_reader :name,:badconsequence, :levelChangeAgainstCultistPlayer
  attr_writer :combatLevel
  
  
  #por que peta?
  def self.newCultistMonster(name,combatLevel,prize,badConsequence,ic)
    new(name,combatLevel,prize,badConsequence,ic)
  end
  
  
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
  
  def combatLevel()
    dice=Dice.instance
    r=dice.nextNumber()
    if(r>5)
      card=CardDealer.instance
      friend=card.getRandomUnusedMonster()
      if(friend !=nil)
        cl=friend.combatLevel()
      else
        cl=0
      end
    end
    return cl
  end
end

end
 
