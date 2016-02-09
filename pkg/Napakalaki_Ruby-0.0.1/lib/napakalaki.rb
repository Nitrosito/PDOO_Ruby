# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'singleton'
require_relative 'card_dealer.rb'
require_relative'player.rb'
require_relative 'cultist_player.rb'
require_relative 'bad_consequence.rb'
require_relative 'dice.rb'
require_relative 'combat_result.rb'
require_relative 'monster.rb'
require_relative 'treasure.rb'
require_relative 'treasure_kind.rb'
module NapakalakiGame
class Napakalaki
  include Singleton
  
  def initialize
    @currentPlayer=nil
    @players=Array.new
    @dealer=CardDealer.instance
    @currentMonster
  end
  
  attr_reader  :currentPlayer, :currentMonster 
  
  def initPlayers(names)
    names.each do |i|
      @players << Player.new(i)
    end
  end
  
  
  def nextPlayer
    indice=0
    numeroJugadores=@players.size
    if (@currentPlayer==nil)
      indice = rand(numeroJugadores) # 0,1,2
      theNext=@players[indice]     
    else 
      if (@currentPlayer==@players[numeroJugadores-1])
          theNext=@players[0]
      else
          indiceActual=0
          i=0
          @players.each do |p|
            if(p==@currentPlayer)
              indiceActual=i
            end
            i+=1
          end
          theNext=@players[indiceActual+1] 
        end
    end
        return theNext 
  end
  
  def nextTurnAllowed
    if(@currentPlayer==nil)
        return true
    end
    
    return @currentPlayer.validState()
  end
  
  def setEnemies
    @players.each do |i|
      aleatorio = rand(@players.size())
      while(@players.at(aleatorio) == i)
              aleatorio = rand(@players.size())
      end
      i.enemy = @players.at(aleatorio)  
    end
  end
  
  public
  
  def developCombat
    aux=@currentPlayer.combat(@currentMonster)
    if(aux==CombatResult::LOSEANDCONVERT)
      carta=@dealer.nextCultist()
      jugador = CultistPlayer.new(@currentPlayer, carta )
      @players.each do |player|
        if(player == @currentPlayer)
          player = jugador
        end
      end
      @players.delete(@currentPlayer)
      @players << jugador
    end
        @dealer.giveMonsterBack(@currentMonster)
    return aux
  end
  
  def discardVisibleTreasures(treasures)
    treasures.each do |i|
      @currentPlayer.discardVisibleTreasure(i)
      @dealer.giveTreasureBack(i)
    end
  end
  
  def discardHiddenTreasures(treasures)
    treasures.each do |i|
      @currentPlayer.discardHiddenTreasure(i)
      @dealer.giveTreasureBack(i)
    end
  end
  
  def makeTreasuresVisible(treasures)
    treasures.each do |i|
      @currentPlayer.makeTreasureVisible(i)
    end
  end
  
  def initGame(players)
    self.initPlayers(players)
    self.setEnemies()
    @dealer.initCards()
    self.nextTurn()
  end
  
  def nextTurn
    stateOK=nextTurnAllowed() 
    if stateOK
      @currentMonster=@dealer.nextMonster()
      @currentPlayer=nextPlayer()
      dead=@currentPlayer.dead
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
end