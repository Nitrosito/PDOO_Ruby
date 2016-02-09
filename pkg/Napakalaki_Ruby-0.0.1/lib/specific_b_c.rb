# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiGame
class SpecificBC < BadConsequence
  def initialize(aText,someLevels,someSpecificVisibleTreasures,someSpecificHiddenTreasures)
    super(aText,someLevels)
    @specificVisibleTreasures = someSpecificVisibleTreasures
    @specificHiddenTreasures = someSpecificHiddenTreasures
  end
  public_class_method :new
  attr_reader :specificVisibleTreasures, :specificHiddenTreasures
  
def isEmpty
    if @specificVisibleTreasures.size==0 && @specificHiddenTreasures.size==0
      return true
    end
    return false
end



def substractVisibleTreasure(t)
    esta=false
    @specificVisibleTreasures.each do |i|
      if t.type == @specificVisibleTreasures.at(i).type
        esta=true
      end
    end
    
    if esta
      @specificVisibleTreasures.delete(i)
    end
end

def substractHiddenTreasure(t)
   esta=false
    @specificHiddenTreasures.each do |i|
      if t.getType() == @specificHiddenTreasures.at(i)
        esta=true
      end
    end
    
    if esta
      @specificHiddenTreasures.delete(i)
end

def adjustToFitTreasureLists(v, h)
       tesoros_visibles = Array.new
       tesoros_ocultos = Array.new
       nv = 0
       nh = 0
       bc = SpecificBC(@text,0,nv,nh)
         esta = false
         if @specificVisibleTreasures == nil
           @specificVisibleTreasures = Array.new
         end
         @specificVisibleTreasures.each do |specificVisibleTreasure|
           v.each do |treasure|  
             if treasure.type == specificVisibleTreasure
               esta = true
           end
             if(esta)
               tesoros_visibles << specificVisibleTreasure
             end             

           end  
         end
         if @specificHiddenTreasures == nil
           @specificHiddenTreasures = Array.new
         end
         @specificHiddenTreasures.each do |specificHiddenTreasure|
           v.each do |treasure|  
             if treasure.type == specificHiddenTreasure
               esta = true
           end
             if(esta)
               tesoros_ocultos << specificHiddenTreasure
             end             

           end  
         end
         bc = specificBC.new(@text,0,tesoros_visibles, tesoros_ocultos)
       return bc

    end
 end
end
end
