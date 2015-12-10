# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiGame
class CultistPlayer < Player
  def initialize(myCultistCard,enemy)
    @totalCultistPlayers =0
    @myCultistCard = myCultistCard
    super
    @enemy=enemy
  end
  
  protected 
  def getCombatLevel(m)
    return m.combatLevel
  end
  
  def getOponentLevel(m)
    #cosa rara
    return 0
  end
  
  def shouldConvert
    return false
  end
  
  private
  def giveMeATreasure
    return nil
  end
  
  def canYouGiveMeATreasure
    
  end
  
  def getTotalCultistPlayers
    return 1
  end
  
end
end
