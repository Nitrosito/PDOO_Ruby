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
    attr_reader :text, :levels, :nVisibletreasures, :nHiddenTreasures, :death, :specificVisibleTreasures, :specificHiddenTreasures

  
  def self.newLevelNumberOfTreasures(aText,someLevels,someVisibleTreasures,someHiddenTreasures)
    new(aText,someLevels,someVisibleTreasures,someHiddenTreasures,nil,nil,false)
  end
  
  def self.newLevelSpecificTreasures(aText,someLevels,someSpecificVisibleTreasures,someSpecificHiddenTreasures)
    new(aText,someLevels,0,0,someSpecificVisibleTreasures,someSpecificHiddenTreasures,false)
  end
  
  def self.newDeath(aText,death)
    new(aText,0,0,0,nil,nil,death)
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
    if @nVisibleTreasures ==0 && @nHiddenTreasures==0 && @specificVisibleTreasures==[] && @specificHiddenTreasures==[]
      return true
    end
    
    return false
  end
  
  def substractVisibleTreasure(t)
    esta=false
    @specificVisibleTreasures.each do |i|
      if t.getType() == @specificVisibleTreasures.at(i)
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
  
  def adjustToFitTreasureLists(v,h)
    badConsequenceAdjust=BadConsequence.newLevelNumberOfTreasures('', 1, 0, 0); #???????????????????????? asi o se crea?
        nVis=0, nHid=0
        nuevosVisibles=Array.new
        nuevosHidden=Array.new
        if(@nVisibleTreasures>0 || @nHiddenTreasures>0)
            
            if(@nVisibleTreasures>v.size)
                nVis=v.size
            #Si la pérdida de tesoros no supera a los tesoros del jugador
            #se queda con los tesosos originales
            else
                nVis=@nVisibleTreasures
            end
            
            if(@nHiddenTreasures>h.size)
                nHid=h.size
            else
                nHid=@nHiddenTreasures
            end
        
            #Creación del badConsequence ajustado:
           
            badConsequenceAdjust=BadConsequence.newLevelNumberOfTreasures( "", 0, nVis,nHid)
        
        
        
        else
          if( v.size > 0 || h.size > 0)
            #Recorro la lista de tesoros visibles del jugador y del mal rollo, y
            #los que coincidan serán añadidos al badconsequence ajustado.
            copiaVisible=Array.new(v)
            copiaHidden=Array.new(h)
            
            
            v.each do|vis|
              
                copiaVisible.each { |elementoCopiaVisible|
                    
                    if(vis.type == elementoCopiaVisible)
                        nuevosVisibles<<elementoCopiaVisible
                        copiaVisible.delete(elementoCopiaVisible)
                        break
                    end
                }             
            end
            
            h.each do |hid|
                copiaHidden.each { |elementoCopiaHidden|
                    
                    if(hid.type == elementoCopiaHidden)
                        nuevosHidden<<elementoCopiaHidden
                        copiaHidden.delete(elementoCopiaHidden)
                        break
                    end
                }
             
            end
            badConsequenceAdjust=BadConsequence.newLevelSpecificTreasures( "", 0, nuevosHidden,nuevosVisibles); 
        end
        end
        return badConsequenceAdjust;
  end
  
  
end
end
