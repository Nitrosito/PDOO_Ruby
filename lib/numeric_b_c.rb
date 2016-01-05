# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class NumericBC < BadConsequence
  def initialize(text, levels, nVisible, nHidden) 
    super(text,levels)
    @nVisibleTreasures=nVisible
    @nHiddenTreasures=nHidden
  end
  
  attr_reader :nVisibleTreasures, :nHiddenTreasures
  
  public 
  
  def isEmpty
    if(@nVisibleTreasures==0 && @nHiddenTreasures==0)
      return true
    end
    return false
  end
  
  private
  
  def substractVisibleTreasure(t)
    if(@nVisibleTreasures > 0)
      @nVisibleTreasures = @nVisibleTreasures - 1
    end
  end
  
  def substractHiddenTreasure(t)
    if(@nHiddenTreasures > 0)
      @nHiddenTreasures = @nHiddenTreasures -1
    end
  end
  
  def adjustToFitTreasureLists(v,h)
    
  end
end
