# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Player
  def initialize(name)
    @name=name
    @level=1
    @dead=true
    @canISteal=true
    @enemy=nil
    @hiddenTreasures=Array.new
    @visibleTreasures=Array.new
    @pendingBadConsequence=nil
    @@MAXLEVEL=10
  end
  
  attr_reader :name, :level, :hiddenTreasures, :visibleTreasures, :dead, :canISteal 
  attr_writer :pendingBadConsequence,:enemy 
  
  private
  
  def canYouGiveMeATreasure()
    if(@hiddenTreasures.empty?)
      return false
    end
    return true
 end
 
  
  def bringToLife()
    @dead=false
  end
  
def getCombatLevel()
    suma = 0
    @visibleTreasures.each do |i|
      suma = suma+i.bonus
    end
    return @level+suma
  end
  
  def incrementLevels(i)
       @level+=i
       if(@level>10)
           @level=10;
       end
  end
  
  def haveStolen()
    @canISteal=false
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
    if(@pendingBadConsequence.isEmpty && @hiddenTreasures <=4)
      return true
    end
    return false
  end
  
  def initTreasure()
    
  end
  
  def stealTreasure()
    
  end
        
end









