# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'napakalaki'
require_relative 'treasure_kind.rb'
module NapakalakiGame
class Examen
  def initialize
    
  end
  
  def run()
    implicav = Array.new
    implicav << TreasureKind::ONEHAND
    implicav << TreasureKind::BOTHHANDS
    
    implicah = Array.new

    implicah << TreasureKind::ARMOR
    
    malrollo = 
    BadConsequence.newLevelSpecificTreasures("Examen",0,implicav,implicah)
  
    
    puts "Mal rollo antes" 
    puts malrollo
    
    v = Array.new
    v << TreasureKind::ONEHAND
    v << TreasureKind::ARMOR
    v << TreasureKind::HELMET
    
    h = Array.new
    h << TreasureKind::HELMET
    h << TreasureKind::ARMOR
    h << TreasureKind::SHOES
    h << TreasureKind::ARMOR
    
    puts "\nMal rollo despues"
    puts  malrollo.adjustToFitTreasureLists(v, h)

  end
end
end
