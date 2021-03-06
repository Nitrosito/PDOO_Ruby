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
require_relative "numeric_b_c.rb"
require_relative "specific_b_c"
require_relative "card_dealer"
require_relative "combat_result"
require_relative "death_b_c"
module NapakalakiGame
class Player
  @@MAXLEVEL=10
  def initialize(namev, level=1,dead=true,canISteal=true,enemy=nil,ht=Array.new,vt=Array.new,pbc=NumericBC.new('', 0, 0, 0))
    @name=namev
    @level=level
    @dead=dead
    @canISteal=canISteal
    @enemy=enemy
    @hiddenTreasures=ht
    @visibleTreasures=vt
    @pendingBadConsequence=pbc
    
  end
  
  attr_reader :name, :level, :dead, :canISteal, :hiddenTreasures, :visibleTreasures, :pendingBadConsequence
  attr_accessor :enemy
  attr_writer :pendingBadConsequence

  
  def self.newCopia(p)
    new(p.name, p.level,p.dead,p.canISteal,p.enemy,p.hiddenTreasures,p.visibleTreasures,p.pendingBadConsequence)
    
  end
  
  private
  

 
  
  def bringToLife()
    @dead=false
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
    @level=@level-i
    if(@level<1)
           @level=1
    end
  end
  
  def applyPrize(m)
    nLevels=m.getLevelsGained()
    incrementLevels(nLevels)
    nTreasures=m.getTreasuresGained()
    if nTreasures > 0
      dealer=CardDealer.instance
      for i in 0..nTreasures
        aux=dealer.nextTreasure()
        @hiddenTreasures << aux
      end
    end
  end
  
  def applyBadConsequence(m)
    bc=m.badconsequence
    nLevels=bc.levels
    decrementLevels(nLevels)
    pendingBad=bc.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
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

  #FIXME i , o i.type?
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
    rnd=rand(@hiddenTreasures.size())
    aux = @hiddenTreasures.at(rnd)
    @hiddenTreasures.delete_at(rnd)
    return aux
  end
 
  
    def canYouGiveMeATreasure()
      return !@hiddenTreasures.empty?
    end
 
  def combat(m)
    myLevel=getCombatLevel
    monsterLevel=getOponentLevel(m)
    if myLevel>monsterLevel
      applyPrize(m)
      if(@level >= @@MAXLEVEL)
        return CombatResult::WINGAME
      else
        return CombatResult::WIN
      end
    else
      applyBadConsequence(m)
      if(shouldConvert())
        return CombatResult::LOSEANDCONVERT
      end
      
      return CombatResult::LOSE
    end
  end
  
  def makeTreasureVisible(t)
    canI=canMakeTreasureVisible(t)
    if canI==true
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
    if((@pendingBadConsequence==nil || @pendingBadConsequence.isEmpty) && @hiddenTreasures.size <=4)
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

    "Nombre del jugador: #{@name}
     Nivel del jugador: #{@level}
     Sectario: No"

  end
  
  protected
  def getOponentLevel(m) 
    return m.combatLevel()
  end
  
  def shouldConvert
    dado=Dice.instance
      dado1=dado.nextNumber()
    if(dado1==1)
      return true
    end
    return false
  end
  
  def getCombatLevel
    suma = 0
    @visibleTreasures.each do |i|
      suma = suma+i.bonus
    end
    return @level+suma
  end
          
end
end









