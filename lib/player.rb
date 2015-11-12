# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Player
  def initialize(name)
    @name=name
    @level
    @dead=true
    @canISteal=true
    @enemy
    @hiddenTreasures
    @visibleTreasures
    @pendingBadConsequence
    @MAXLEVEL=10
  end
  
  attr_reader :name, :level, :hiddenTreasures, :visibleTreasures, :dead, :canISteal 
  attr_writer :pendingBadConsequence,:@enemy 
  
  def bringToLife()
    @dead=true
  end
  
def getCombatLevel()
    suma = 0
    @visibleTreasures.each do |i|
      suma = suma+i.bonus
    end
    @level+suma
  end
  
  def incrementLevels(i)
       @level+=i
       if(@level>10)
           @level=10;
       end
  end
  
  def decrementLevels(i)
    @level-=i
    if(@level<1)
           @level=1
    end
  end
  
  def applyPrize(m)
    
  end
  
  def applyBadConsequence(m)
    
  end
  
  def canMakeTreasureVisible(t)
    
  end
  
  def howManyVisibleTreasures(tkind)
    @visibleTreasures.each do |i|
    n = 0
      if(tkind == i)
        n += 1
      end
    end
    return n
  end
  
  def dielfNoTreasures()
    if(@hiddenTreasures.empty? && @visibleTreasures.empty?)
      @dead = true;
    end
  end
  
  def giveMeATreasure()
    
  end
  
def canYouGiveMeATreasure()
    if(! @visibleTreasures.empty? || ! @hiddenTreasures.empty?)
      return true
    end
    return false
  end
  
  def haveStolen()
    @canISteal=false
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
    if(@pendingBadConsequence.empty() && @hiddenTreasures <=4)
      return true
    end
  else
    return false
  end
  
  def initTreasure()
    
  end
  
  def stealTreasure()
    
  end
        
end









