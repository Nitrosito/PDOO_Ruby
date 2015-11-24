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
    
  end
  
  public
  
  def developCombat
    
  end
  
  def discardVisibleTreasures(treasures)
    
  end
  
  def discardHiddenTreasures(treasures)
    
  end
  
  def makeTreasuresVisible(treasures)
    
  end
  
  def initGame(players)
    
  end
  
  def getCurrentPlayer
    
  end
  
  def getCurrentMonster
    
  end
  
  def nextTurn
    
  end
  
  def endOfGame(result)
    
  end
end
