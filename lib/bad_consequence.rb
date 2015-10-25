# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class BadConsequence
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures, someSpecificVisibleTreasures, someSpecificHiddenTreasures, death)
    @text = aText
    @levels = someLevels
    @nVisibleTreasures = someVisibleTreasures
    @nHiddenTreasures = someHiddenTreasures
    @specificVisibleTreasures = someSpecificVisibleTreasures
    @specificHiddenTreasures = someSpecificHiddenTreasures
    @death = death
  end
  
    attr_accessor :text, :levels, :nVisibletreasures, :nHiddenTreasures, :death, :specificVisibleTreasures, :specificHiddenTreasures

  
  def self.newLevelNumberOfTreasures(aText,someLevels,someVisibleTreasures,someHiddenTreasures)
    new(aText,someLevels,someVisibleTreasures,someHiddenTreasures,nil,nil,false)
  end
  
  def self.newLevelSpecificTreasures(aText,someLevels,someSpecificVisibleTreasures,someSpecificHiddenTreasures)
    new(aText,someLevels,0,0,someSpecificVisibleTreasures,someSpecificHiddenTreasures,false)
  end
  
  def self.newDeath(aText)
    new(aText,0,0,0,nil,nil,true)
  end
  
  private_class_method:new ##FIXME Esto va aqui o delante de todos los def de los metodos new*?
  
  def to_s
    "
         Nombre: #{@aText}
         Niveles: #{@levels}
         N Tesoros Visibles: #{@nVisibleTreasures}
         N Tesoros Ocultos: #{@nHiddenTreasures}
         Tesoros Visibles Especificos #{@specificVisibleTreasures}
         Tesoros Ocultos Especificos #{@specificHiddenTreasures}
         Muerte: #{@death}\n"
  end
  
  
end
