# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiGame
  class NumericBC < BadConsequence
  def initialize(aText,someLevels,someVisibleTreasures,someHiddenTreasures)
    super(aText,someLevels)
    @nVisibleTreasures = someVisibleTreasures
    @nHiddenTreasures = someHiddenTreasures
  end
  
  
  public_class_method :new
  
  attr_reader :nVisibleTreasures, :nHiddenTreasures, :MAXTREASURES


def isEmpty
    if @nVisibleTreasures ==0 && @nHiddenTreasures==0
      return true
    end
    return false
end



def substractVisibleTreasure(t)
   if @nVisibleTreasures > 0
      @nVisibleTreasures -=1
   end
end

def substractHiddenTreasure(t)
   if @nHiddenTreasures > 0
      @nHiddenTreasures -=1
   end
end

def adjustToFitTreasureLists(v, h)
  nv = 0
  nh = 0
  bc = NumericBC.new("",0,0,0)

  if @nHiddenTreasures > 0 or @nVisibleTreasures > 0
      if @nVisibleTreasures > v.size 
        nv = v.size


      else
        nv = @nVisibleTreasures  
      end

      if @nHiddenTreasures > h.size
        nh = h.size                    
      else
        nh = @nHiddenTreasures
      end

      bc = NumericBC.new(@text,0,nv,nh)

    return bc
  end
  
   def to_s  
    "#{@text}\n\nNiveles que pierdes: #{@levels}
    \nNumero de tesoros visibles que pierdes: #{@nVisibleTreasures}
    \nNumero de tesoros ocultos que pierdes: #{@nHiddenTreasures}\n"   
  end
end  
  
 end
end
