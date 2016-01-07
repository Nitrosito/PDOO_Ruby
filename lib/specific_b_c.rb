# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class SpecificBC < BadConsequence
  def initialize(text,levels,tVisible,tHidden)
    super(text,levels)
    @specificVisibleTreasures=tVisible
    @specificHiddenTreasures=tHidden
  end
  
  attr_accesor :specificVisibleTreasures, :specificHiddenTreasures
  
  public
  def isEmpty
    if(@specificHiddenTreasures.size== 0 && @specificVisibleTreasures.size == 0)
         return true
    end     
    return false
  end
  
  private
  def substractVisibleTreasure(t)
    esta=false
    @specificVisibleTreasures.each do |i|
      if t.type == @specificVisibleTreasures.at(i).type
        esta=true
      end
    end
    
    if esta
      @specificVisibleTreasures.delete(i)
    end
  end
  
  def substractHiddenTreasure(t)
     esta=false
    @specificHiddenTreasures.each do |i|
      if t.getType() == @specificHiddenTreasures.at(i)
        esta=true
      end
    end
    
    if esta
      @specificHiddenTreasures.delete(i)
    end
  end
  
  def adjustToFittreasureLists
    
  end
  
end
