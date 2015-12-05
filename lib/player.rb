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
    puedo = false
    
    unamano = 0
    dosmanos = 0
    armadura = 0
    casco = 0
    zapatos = 0
    
    @visibleTreasures.each do |i|
      if i.type == TreasureKind::ONEHAND
        unamano += 1
      elsif i.type == TreasureKind::BOTHHANDS
        dosmanos += 1
      elsif i.type == TreasureKind::ARMOR
        armadura += 1
      elsif i.type == TreasureKind::HELMET
        casco += 1
      elsif i.type == TreasureKind::SHOES
        zapatos += 1
      end
    end
    
      if (t.type == TreasureKind::ONEHAND && unamano < 2 && dosmanos == 0)
        puedo = true
      elsif (t.type == TreasureKind::BOTHHANDS && unamano == 0 && dosmanos == 0)
        puedo = true
      elsif (t.type == TreasureKind::ARMOR && armadura == 0)
        puedo = true
      elsif (t.type == TreasureKind::HELMET && casco == 0)
        puedo = true
      elsif (t.type == TreasureKind::SHOES && zapatos == 0)
        puedo = true
      end 
    return puedo
  end

  
  def howManyVisibleTreasures(tkind)
        n = 0
    @visibleTreasures.each do |i|
      if(tkind == i)
        n += 1
      end
    end
    return n
  end
  
  def dielfNoTreasures()
    if(@hiddenTreasures.size==0 && @visibleTreasures.size==0)
      @dead=true
    end
  end
  
  ##FIXME
    public
  def giveMeATreasure()
    rnd=Rand(@hiddenTreasures.size())
    aux = @hiddenTreasures.at(rnd)
    @hiddenTreasures.delete_at(rnd)
    return aux
  end
 
  
    def canYouGiveMeATreasure()
      return !@hiddenTreasures.empty?
    end
 
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
      @hiddenTreasures.delete(t)
    end
  end
  
  def discardVisibleTreasure(t)
    @visibleTreasures.delete(t)
    if @pendingBadConsequence!=nil && !@pendingBadConsequence.isEmpty()
      @pendingBadConsequence.substractVisibleTreasure(t)
    end
    dielfNoTreasures()
  end
  
  def discardHiddenTreasure(t)
    @hiddenTreasures.delete(t)
    if @pendingBadConsequence!=nil && !@pendingBadConsequence.isEmpty()
      @pendingBadConsequence.substractHiddenTreasure(t)
    end
    dielfNoTreasures()
  end
  
  def validState()
    if(@pendingBadConsequence.isEmpty && @hiddenTreasures.size <=4)
      return true
    end
    return false
  end
  
  def initTreasures()
    dealer=CardDealer.instance()
    dice=Dice.instance()
    bringToLife()
    treasure=dealer.nextTreasure()
    @hiddenTreasures<< treasure
    number=dice.nextNumber()
    
    if number > 1
      treasure1=dealer.nextTreasure()
      @hiddenTreasures<< treasure1
    end
    
    if number ==6
      treasure1=dealer.nextTreasure()
      @hiddenTreasures<< treasure1
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
    @visibleTreasures.each do |i|
      discardVisibleTreasure(i)
    end
    
    @hiddenTreasures.each do |i|
      discardHiddenTreasure(i)
    end
  end
  
  def to_s

    "\nNombre del jugador: #{@name}
    \nNivel del jugador: #{@level}"

  end
          
end
end









