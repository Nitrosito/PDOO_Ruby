# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiGame
class BadConsequence
  @@MAXTREASURES=10
  def initialize(aText, someLevels)
    @text = aText
    @levels = someLevels
  end

  attr_reader :text, :levels, :MAXTREASURES
  
  private_class_method:new 
  
#  def to_s
#    "
      #   Nombre: #{@text}
      #   Niveles: #{@levels}
      #   N Tesoros Visibles: #{@nVisibleTreasures}
      #   N Tesoros Ocultos: #{@nHiddenTreasures}
      #   Tesoros Visibles Especificos: #{@specificVisibleTreasures}
      #   Tesoros Ocultos Especificos: #{@specificHiddenTreasures}
      #   Muerte: #{@death}\n#"
#  end
  
  public
  
  def isEmpty
    raise NotImplementedError.new
  end
    
  def substractVisibleTreasure(t)
    raise NotImplementedError.new
  end
  
  def substractHiddenTreasure(t)
    raise NotImplementedError.new
  end
  
def adjustToFitTreasureLists(v, h)
    raise NotImplementedError.new         
end  

end
end
