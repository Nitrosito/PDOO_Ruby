# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Napakalaki
  include singleton
  
  def initialize
    @currentPlayer
    @players
    @dealer
    @currentMonster
  end
  
  attr_reader :currentPlayer, :currentMonster
  
  def initPlayers(names)
    for name in names
      @players.add(name)
    end
  end
  
  def nextPlayer
    
  end
  
  def nextTurnAllowed
    
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
    if result==WINGAME
      return true
    end
    return false
  end
end
