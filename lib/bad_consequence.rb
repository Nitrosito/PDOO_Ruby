# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class BadConsequence
  @@MAXTREASURES=10
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures, someSpecificVisibleTreasures=Array.new, someSpecificHiddenTreasures=Array.new, death)
    @text = aText
    @levels = someLevels
    @nVisibleTreasures = someVisibleTreasures
    @nHiddenTreasures = someHiddenTreasures
    @specificVisibleTreasures = someSpecificVisibleTreasures
    @specificHiddenTreasures = someSpecificHiddenTreasures
    @death = death
  end
  
  #FIXME text y muerte no lo pide
    attr_reader :text, :levels, :nVisibletreasures, :nHiddenTreasures, :death, :specificVisibleTreasures, :specificHiddenTreasures

  
  def self.newLevelNumberOfTreasures(aText,someLevels,someVisibleTreasures,someHiddenTreasures)
    new(aText,someLevels,someVisibleTreasures,someHiddenTreasures,nil,nil,false)
  end
  
  def self.newLevelSpecificTreasures(aText,someLevels,someSpecificVisibleTreasures,someSpecificHiddenTreasures)
    new(aText,someLevels,0,0,someSpecificVisibleTreasures,someSpecificHiddenTreasures,false)
  end
  
  def self.newDeath(aText,death)
    new(aText,0,0,0,nil,nil,death)
  end
  
 
  private_class_method:new 
  
  def to_s
    "
         Nombre: #{@text}
         Niveles: #{@levels}
         N Tesoros Visibles: #{@nVisibleTreasures}
         N Tesoros Ocultos: #{@nHiddenTreasures}
         Tesoros Visibles Especificos: #{@specificVisibleTreasures}
         Tesoros Ocultos Especificos: #{@specificHiddenTreasures}
         Muerte: #{@death}\n"
  end
  
  public
  #FIXME
  def isEmpty
    if @nVisibleTreasures ==0 && @nHiddenTreasures==0 && @specificVisibleTreasures.size==0 && @specificHiddenTreasures==0
      return true
    end
    
    return false
  end
  
  def substractVisibleTreasure(t)
    esta=false
    @specificVisibleTreasures.each do |i|
      if t.getType() == @specificVisibleTreasures.at(i)
        esta=true
      end
    end
    
    if esta
      @specificVisibleTreasures.delete(i)
    elseif @nVisibleTreasures > 0
      @nVisibleTreasures -=1
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
    elseif @nHiddenTreasures > 0
      @nHiddenTreasures -=1
    end
  end
  
  def adjustToFitTreasureLists(v,h)
    
  end
  
  
end
