# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class CardDealer
  include singleton
  
  def initializer
    @unusedMonster
    @usedMonster
    @unusedTreasures
    @usedTreasures    
  end
  
  def initTreasureCardDeck
  
  end
  
  def initMonsterCardDeck
    
  end
  
  def shuffleTreasures
    
  end
  
  def shuffleMonsters
    
  end
  
  public 
  
  def nextTreasure
  
  end
  
  def nextMonster
    
  end
  
  def giveTreasureBack(t)
    @usedTreasures.push(t)
  end
  
  def giveMonsterBack(m)
    @usedMonsters.push(m)
  end
  
  def initCards
    
  end
  
  
  
end
