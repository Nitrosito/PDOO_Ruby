# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiGame
class BadConsequence
  @@MAXTREASURES=10
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures, someSpecificVisibleTreasures, someSpecificHiddenTreasures, death)
    @text = aText
    @levels = someLevels
    @nVisibleTreasures = someVisibleTreasures
    @nHiddenTreasures = someHiddenTreasures
    @specificVisibleTreasures = someSpecificVisibleTreasures
    @specificHiddenTreasures = someSpecificHiddenTreasures
    @death = death
  end
  
  #FIXME text y muerte no lo pide
    attr_accessor :text, :levels, :nVisibleTreasures, :nHiddenTreasures, :death, :specificVisibleTreasures, :specificHiddenTreasures,:MAXTREASURES

  
  def self.newLevelNumberOfTreasures(aText,someLevels,someVisibleTreasures,someHiddenTreasures)
    new(aText,someLevels,someVisibleTreasures,someHiddenTreasures,Array.new,Array.new,false)
  end
  
  def self.newLevelSpecificTreasures(aText,someLevels,someSpecificVisibleTreasures,someSpecificHiddenTreasures)
    new(aText,someLevels,0,0,someSpecificVisibleTreasures,someSpecificHiddenTreasures,false)
  end
  
  def self.newDeath(aText,death)
    new(aText,0,0,0,Array.new,Array.new,death)
  end
  
 
  private_class_method:new 
  
  def to_s
    "
         Nombre: #{@text}
         Niveles: #{@levels}
         N Tesoros Visibles: #{@nVisibleTreasures}
         N Tesoros Ocultos: #{@nHiddenTreasures}
         Tesoros Visibles Especificos: #{@specificVisibleTreasures}
         Tesoros Ocultos Especificos: #{@specificHiddenTreasures}
         Muerte: #{@death}\n"
  end
  
  public
  #FIXME
  def isEmpty
    if @nVisibleTreasures ==0 && @nHiddenTreasures==0 && @specificVisibleTreasures.size==0 && @specificHiddenTreasures.size==0
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
    elseif @nVisibleTreasures > 0
      @nVisibleTreasures -=1
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
    elseif @nHiddenTreasures > 0
      @nHiddenTreasures -=1
    end
  end
  
def adjustToFitTreasureLists(v, h)
            tesoros_visibles = Array.new
            tesoros_ocultos = Array.new
            nv = 0
            nh = 0
            bc = BadConsequence.newLevelNumberOfTreasures("",0,0,0)

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

                bc = BadConsequence.newLevelNumberOfTreasures(@text,0,nv,nh)
            else
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
              bc = BadConsequence.newLevelSpecificTreasures(@text,0,tesoros_visibles, tesoros_ocultos)
            return bc

        end
    end  
  
end
end
