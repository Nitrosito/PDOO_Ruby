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
  
  attr_accesor :totalCultistPlayers
  
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
