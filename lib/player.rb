# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Player
  def initialize(name)
    @name=name
    @level
    @dead=true
    @canlSteal=true
    @enemy
    @hiddenTreasures
    @visibleTreasures
    @pendingBadConsequence
    @MAXLEVEL=10
  end
  
  attr_reader :name, :level, :hiddenTreasures, :visibleTreasures, :dead 
  attr_writer :pendingBadConsequence  
  
  def bringToLife()
    
  end
  
  def getCombatLevel()
    
  end
  
  def incrementLevels(i)
    
  end
  
  def decrementLevels(i)
    
  end
  
  def applyPrize(m)
    
  end
  
  def applyBadConsequence(m)
    
  end
  
  def canMakeTreasureVisible(t)
    
  end
  
  def howManyVisibleTreasures(tKind)
    
  end
  
  def dielNoTreasures()
    
  end
  
  def giveMeATreasure()
    
  end
  
  def canYouGiveMeATreasure()
    
  end
  
  def haveStolen()
    
  end

  public
  
  def combat(m)
    
  end
  
  def makeTreasureVisible(t)
    
  end
  
  def discardVisibletreasure(t)
    
  end
  
  def discardHiddenTreasure(t)
    
  end
  
  def validState()
    
  end
  
  def initTreasure()
    
  end
  
  def stealTreasure()
    
  end
  
  def setEnemy(enemy)
    
  end
  
  def canlSteal()
    
  end
  
  def descardAlltreasures()
    
  end
end









