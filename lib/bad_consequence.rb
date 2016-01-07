# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiGame
class BadConsequence
  @@MAXTREASURES=10
  def initialize(aText,someLevels)
    @text = aText
    @levels = someLevels
  end
  private_class_method:new 
  #FIXME text y muerte no lo pide
    attr_accessor :text, :levels, :MAXTREASURES

  
  
  def to_s
    raise NotImplementedError.new
  end
  
  public
  #FIXME
  def isEmpty
    raise NotImplementedError.new
  end
    
  private
  def substractVisibleTreasure(t)
    raise NotImplementedError.new
  end
  
  def substractHiddenTreasure(t)
     raise NotImplementedError.new
  end
  
  public
def adjustToFitTreasureLists(v, h)
            raise NotImplementedError.new
    end  
  
end
end
