# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class BadConsequence
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures, someSpecificVisibleTreasures, someSpecificHiddenTreasures, death)
    @text = aText
    @levels = someLevels
    @nVisibleTreasures = someVisibleTreasures
    @nHiddenTreasures = someHiddenTreasures
    @death = death
  end
  
    attr_accessor :text, :levels, :nVisibletreasures, :nHiddenTreasures, :death

  
  def self.newLevelNumberOfTreasures(aText,someLevels,someVisibleTreasures,someHiddenTreasures)
    new(aText,someLevels,someVisibleTreasures,someHiddenTreasures,nil,nil,false)
  end
  
  def self.newLevelSpecificTreasures(aText,someLevels,someSpecificVisibleTreasures,someHiddenTreasures)
    new(aText,someLevels,0,0,someSpecificVisibleTreasures,someSpecificHiddenTreasures,false)
  end
  
  def self.newDeath(aText)
    new(aText,0,0,0,nil,nil,true)
  end
  
  private_class_method:new ##FIXME Esto va aqui o delante de todos los def de los metodos new*?
  
  
end
