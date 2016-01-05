# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'napakalaki'
require_relative 'Command'
module NapakalakiGame

class Examen
  def initialize
    
  end
  
  svt=Array.new   
  svt << [TreasureKind::BOTHHANDS]
  svt << [TreasureKind::ONEHAND]
  svt << [TreasureKind::ONEHAND]
  
 
  def run()
    badConsequence= 
      BadConsequence.newLevelSpecificTreasures("mal rollo de prueba",0,svt,[TreasureKind::SHOES])
    
    puts "mal rollo antes de la lista\n"
    puts badConsequence
    
    v=Array.new 
    v << [TreasureKind::ONEHAND]
    v << [TreasureKind::HELMET]
    
    h=Array.new 
    h << [TreasureKind::HELMET]
    h << [TreasureKind::SHOE]
    h << [TreasureKind::ARMOR]
    h << [TreasureKind::SHOE]
    
    badConsequence.adjustToFitTreasureLists(v, h)
    
    puts "mal rollo despues de la lista\n"
    puts badConsequence
    
    lista=Array.new 
    lista << [TreasureKind::SHOES]
    lista << [TreasureKind::ONEHAND]
    lista << [TreasureKind::SHOES]
    lista << [TreasureKind::BOTHHANDS]
    lista << [TreasureKind::ONEHAND]
    lista << [TreasureKind::ARMOR]
    
    jugador=Player.new("hugador")
    jugador.setHiddenTreasures(lista)
    
  end
end
end