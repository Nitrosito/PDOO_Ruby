# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'singleton'
require 'card_dealer.rb'
require 'player.rb'
class Napakalaki
  include Singleton
  
  def initialize
    @currentPlayer=nil
    @players=Array.new
    @dealer=Cardealer.instance
    @currentMonster=nil
  end
  
  attr_reader  :currentPlayer, :currentMonster 
  
  def initPlayers(names)
    names.each do |i|
      @players << Player.new(i);
    end
  end
  
  def nextPlayer
    if(@currentPlayer==nil) 
      aleatorio = rand(@players.size())
      return @players.at(aleatorio)
    end
    
    if(@players.index(@currentPlayer)==@players.size()-1)
      return @players.at(0);      
    end
    
    actual = @players.index(@currentPlayer)
    return @players.at(actual+1);
  end
  
  def nextTurnIsAllowed
    if(@currentPlayer==nil)
        return false
    end
    
    return @currentPlayer.validState()
  end
  
  def setEnemies
    @players.each do |i|
      aleatorio = rand(@players.size())
      while(@players.at(aleatorio) == @players.at(i))
              aleatorio = rand(@players.size())
      end
      @players.at(i).enemy = @players.at(aleatorio)  
    end
  end
  
  public
  
  def developCombat
    aux=@currentPlayer.combat(@currentMonster)
    @dealer.giveMonsterBack(@currentMonster)
    return aux
  end
  
  def discardVisibleTreasures(treasures)
    for treasure in treasures
      @currentPlayer.discardVisibleTreasure(treasure)
      @dealer.giveTreasureBack(treasure)
    end
  end
  
  def discardHiddenTreasures(treasures)
    for treasure in treasures
      @currentPlayer.discardHiddenTreasure(treasure)
      @dealer.giveTreasureBack(treasure)
    end
  end
  
  def makeTreasuresVisible(treasures)
    for treasure in treasures
      @currentPlayer.makeTreasureVisible(treasure)
    end
  end
  
  def initGame(players)
    self.initPlayers(players)
    self.setEnemies()
    self.nextTurn()
    @dealer.initCards()
    self.nextTurn()
  end
  
  def getCurrentPlayer
    return @currentPlayer
  end
  
  def getCurrentMonster
    
  end
  
  def nextTurn
    stateOK=nextTurnAllowed()
    if stateOK
      @currentMonster=@dealer.nextMonster()
      @currentPlayer=nextPlayer()
      dead=@currentPlayer.isDead()
      if dead
        @currentPlayer.initTreasures()
      end
    end
    return stateOK
  end
  
  def endOfGame(result)
    if(@result==WINGAME)
      return true
    end
    
      return false
  end
  
  
end
