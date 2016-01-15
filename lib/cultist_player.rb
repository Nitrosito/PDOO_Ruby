# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "player.rb"
module NapakalakiGame
class CultistPlayer 
      @@totalCultistPlayers =0
      
  def initialize(player,myCultistCard)
    Player.newCopia(player)
    @@totalCultistPlayers++
    @myCultistCard = myCultistCard
  end
  
  attr_accessor :totalCultistPlayers
  
  protected 
  def getCombatLevel(m)
    nvplayer=super.getCombatLevel()  #preguntar si es asi el super
    res= ((nvplayer*0.2)+nvplayer)+(m.getLevelsGained() * @totalCultistPlayers)
    return res
  end
  
  def getOponentLevel(m)
    return m.getCombatLevelAgainstCultistPlayer()
  end
  
  def shouldConvert
    return false
  end
  
  private  #estos dos no los se
  def giveMeATreasure
    return nil
  end
  
  def canYouGiveMeATreasure
    
  end

  
end
end
