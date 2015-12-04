# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "card_dealer.rb"
require_relative "bad_consequence.rb"
require_relative "dice.rb"
require_relative "treasure.rb"
require_relative "napakalaki.rb"
require_relative "prize.rb"
require_relative "treasure_kind"
require_relative "card_dealer"
require_relative "combat_result"
module NapakalakiGame
class Player
  @@MAXLEVEL=10
  def initialize(namev)
    @name=namev
    @level=1
    @dead=true
    @canISteal=true
    @enemy=nil
    @hiddenTreasures=Array.new
    @visibleTreasures=Array.new
    @pendingBadConsequence=BadConsequence.newLevelNumberOfTreasures('', 0, 0, 0)
    
  end
  
  attr_reader :name, :level, :dead, :canISteal 
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
    nLevels=m.getLevelsGained()
    incrementLevels(nLevels)
    nTreasures=m.getTreasuresGained()
    if nTreasures > 0
      dealer=CardDealer.getInstance()
      for i in 0..nTreasures
        aux=dealer.nextTreasure()
        @hiddenTreasures << aux
      end
    end
  end
  
  def applyBadConsequence(m)
    badConsequence=m.badconsequence
    nLevels=badConsequence.levels()
    decrementLevels(nLevels)
    pendingBad=badConsequence.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
      @pendingBadConsequence=pendingBad
  end
  
  def canMakeTreasureVisible(t)
    if(@visibleTreasures.size()>=4)
      return false
    end
    
    unamano=0
    dosmanos=0
    cabeza=0
    zapatos=0
    armadura=0
    @visibleTreasures.each do|i|
          if(@visibleTreasures.at(i).type()==ONEHAND)
            unamano+=1
          end
          
          if(@visibleTreasures.at(i).type()==BOTHHANDS)
            dosmanos+=1
          end 
          
          if(@visibleTreasures.at(i).type()==HELMET)
            cabeza+=1
          end 
          
          if(@visibleTreasures.at(i).type()==SHOES)
            zapatos+=1
          end 
          
          if(@visibleTreasures.at(i).type()==ARMOR)
            armadura+=1
          end 
   end   
   
    if((cabeza == 1 && t.type()==HELMET) ||
          (zapatos ==1 && t.type()==SHOES) ||
          (armadura ==1 && t.type()==ARMOR))
      return false
    end
    
    if((unamano==1 && t.type() == BOTHHANDS) ||
          (dosmanos==1 && t.type()==BOTHHANDS)||
           (unamano==2 && t.type()==ONEHAND))
      return false
    end
    
    return true;
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
    rnd=Rand(@hiddenTreasures.size())
    aux = @hiddenTreasures.at(rnd)
    @hiddenTreasures.delete_at(rnd)
    return aux
  end
 

  public
  
  def getVisibleTreasures()
    return @visibleTreasures
  end
  
  def getHiddenTreasures()
   return @hiddenTreasures
  end
  
  def combat(m)
    myLevel=getCombatLevel()
    monsterLevel=m.combatLevel
    if myLevel>monsterLevel
      applyPrize(m)
      if(@level >= @@MAXLEVEL)
        return CombatResult::WINGAME
      else
        return CombatResult::WIN
      end
    else
      applyBadConsequence(m)
      return CombatResult::LOSE
    end
  end
  
  def makeTreasureVisible(t)
    canI=canMakeTreasureVisible(t)
    if canI
      @visibleTreasures << t
    else
      @hiddenTreasures.delete_at(t)
    end
  end
  
  def discardVisibleTreasure(t)
    @visibleTreasures.delete(t)
    if @pendingBadConsequence==nil && !@pendingBadConsequence.isEmpty()
      @pendingBadConsequence.substractVisibleTreasure(t)
    end
    dielNoTreasures()
  end
  
  def discardHiddenTreasure(t)
    @hiddenTreasures.delete(t)
    if @pendingBadConsequence==nil && !@pendingBadConsequence.isEmpty()
      @pendingBadConsequence.substractHiddenTreasure(t)
    end
    dielfNoTreasures()
  end
  
  def validState()
    if(@pendingBadConsequence.isEmpty && @hiddenTreasures <=4)
      return true
    end
    return false
  end
  
  def initTreasures()
    dealer=CardDealer.instance()
    dice=Dice.instance()
    bringToLife()
    treasure=dealer.nextTreasure()
    number=dice.nextNumber()
    
    if number > 1
      treasure1=dealer.nextTreasure()
      @hiddenTreasures << treasure1
    end
    
    if number ==6
      treasure1=dealer.nextTreasure()
      @hiddenTreasures << treasure1
    end
  end
  
  def stealTreasure()
    canI=canISteal
    if canI
      canYou=@enemy.canYouGiveMeATreasure()
      if canYou
        treasure=@enemy.giveMeATreasure()
        @hiddenTreasures << treasure
        haveStolen()
        return treasure
      end
    end
    return nil
  end
  
  def discardAllTreasures()
    for treasure in @visibleTreasures
      discardVisibleTreasure(treasure)
    end
    for treasure in @hiddenTreasures
      discardHiddenTreasure(treasure)
    end
  end
  
  def to_s

    "\nNombre del jugador: #{@name}
    \nNivel del jugador: #{@level}"

  end
          
end
end









