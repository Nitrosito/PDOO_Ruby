#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'singleton'
require_relative "player"
require_relative "napakalaki"
require_relative "bad_consequence"
require_relative "combat_result"
require_relative "prize"
require_relative "treasure"
require_relative "treasure_kind"
require_relative "monster"
require_relative "dice"
require_relative "cultist"
module NapakalakiGame
class CardDealer
  include Singleton
  
   attr_accessor :unusedMonsters, :usedMonsters, :usedTreasures, :unusedTreasures
   
  def initialize
    @unusedMonsters = Array.new
    @usedMonsters = Array.new
    @unusedTreasures = Array.new
    @usedTreasures = Array.new
    @unusedCultist=Array.new
  end
  
  def initTreasureCardDeck
    #¡Si mi amo!
    @unusedTreasures << Treasure.new('¡Si mi amo!',4,(TreasureKind::HELMET))

    #Botas de investigacion
    @unusedTreasures << Treasure.new("Botas de investigacion",3,(TreasureKind::SHOES))

    #Capucha de cthulhu
    @unusedTreasures << Treasure.new("Capucha de cthulhu",3,(TreasureKind::HELMET))

    #A prueba de babas
    @unusedTreasures << Treasure.new("A prueba de babas",2,(TreasureKind::ARMOR))

    #Botas de lluvia acida
    @unusedTreasures << Treasure.new("Botas de lluvia acida",1,(TreasureKind::BOTHHANDS))

    #Casco Minero
    @unusedTreasures << Treasure.new("Casco minero",2,(TreasureKind::HELMET))

    #Ametralladora Thompson
    @unusedTreasures << Treasure.new("Anetralladora Thompson",4,(TreasureKind::BOTHHANDS))

    #Camiseta de la UGR
    @unusedTreasures << Treasure.new("Camiseta de la UGR",1,(TreasureKind::ARMOR))

    #Clavo de rail ferroviario
    @unusedTreasures << Treasure.new("Clavo de rail ferroviario",3,(TreasureKind::ONEHAND))

    #Cuchillo de sushi arcano
    @unusedTreasures << Treasure.new("Cuchillo de sushi arcano",2,(TreasureKind::ONEHAND))

    #Fez alopedo
    @unusedTreasures << Treasure.new("Fez alopedo",3,(TreasureKind::HELMET))

    #Hacha prehistorica
    @unusedTreasures << Treasure.new("Hacha prehistorica",2,(TreasureKind::ONEHAND))

    #/El aparato de Pr.Tesla
    @unusedTreasures << Treasure.new("El aparato de Pr.Tesla",4,(TreasureKind::ARMOR))

    #Gaita
    @unusedTreasures << Treasure.new("Gaita",4,(TreasureKind::BOTHHANDS))

    #Insecticida
    @unusedTreasures << Treasure.new("Insecticida",2,(TreasureKind::ONEHAND))

    #Escopeta de 3 cañones
    @unusedTreasures << Treasure.new("Escopeta de 3 cañones",4,(TreasureKind::BOTHHANDS))

    #Garabato mistico
    @unusedTreasures << Treasure.new("Garabato mistico",2,(TreasureKind::ONEHAND))

    #La rebeca metalica
    @unusedTreasures << Treasure.new("LA rebeca metalica",2,(TreasureKind::ARMOR))

    #Lanzallamas
    @unusedTreasures << Treasure.new("Lanzallamas",4,(TreasureKind::BOTHHANDS))

    #Necrocomicon
    @unusedTreasures << Treasure.new("Necrocomicon",1,(TreasureKind::ONEHAND))

    #Necronomicon
    @unusedTreasures << Treasure.new("Necronomicon",5,(TreasureKind::BOTHHANDS))

    #Linterna a 2 manos
    @unusedTreasures << Treasure.new("Linterna a 2 manos",3,(TreasureKind::BOTHHANDS))

    #Necrognomicon
    @unusedTreasures << Treasure.new("Necrognomicon",2,(TreasureKind::ONEHAND))

    #Necrotelecom
    @unusedTreasures << Treasure.new("Necrotelecom",2,(TreasureKind::HELMET))

    #Mazo de los antiguos
    @unusedTreasures << Treasure.new("Mazo de los antiguos",3,(TreasureKind::ONEHAND))

    #Necroplayboycon
    @unusedTreasures << Treasure.new("Necroplayboycon",3,(TreasureKind::ONEHAND))

    #Porra preternatural
    @unusedTreasures << Treasure.new("Porra preternatural",3,(TreasureKind::ONEHAND))

    #Shogulador
    @unusedTreasures << Treasure.new("Shogulador",1,(TreasureKind::BOTHHANDS))

    #Varita de atizamiento
    @unusedTreasures << Treasure.new("Varita de atizamiento",3,(TreasureKind::ONEHAND))

    #Tentaculo de pega
    @unusedTreasures << Treasure.new("Tentaculo de pega",2,(TreasureKind::HELMET))

    #Zapato deja-amigos
    @unusedTreasures << Treasure.new("Zapato deja-amigos",1,(TreasureKind::SHOES))
#	unusedTreasures.add(new Treasure("Zapato deja-amigos",1, TreasureKind.SHOES));
	  
  end
  
  def initMonsterCardDeck
          #El rey de la rosa
      price =Prize.new(4,2)
      badConsequence =
        BadConsequence.newLevelNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles",5,3,0)
        @unusedMonsters << Monster.new("El rey de la rosa",13,price,badConsequence)

      # Angeles de la noche ibicenca
      badConsequence =
        BadConsequence.newLevelSpecificTreasures("Te atrapan para llevarte de fiesta y te dejan 
      caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta",0,
      [TreasureKind::ONEHAND],
      [TreasureKind::ONEHAND])
      prize = Prize.new(4,1)
      @unusedMonsters << Monster.new("Angeles de la noche ibicenca",14,prize,badConsequence);


      # Byakhees de bonanza
      badConsequence = 
         BadConsequence.newLevelSpecificTreasures("Pierdes tu armadura visible y otra oculta", 0,
         [TreasureKind::ONEHAND],
         [TreasureKind::ONEHAND])
         prize= Prize.new(2, 1)
         @unusedMonsters << Monster.new("Byakhess de bonanza",8,prize,badConsequence)


      #Chibithulhu
      badConsequence = 
        BadConsequence.newLevelSpecificTreasures("Embobados con el lindo primigenio
       te descartas de tu casco visible",0,[TreasureKind::HELMET],nil)
      prize = Prize.new(1, 1)
      @unusedMonsters << Monster.new("Chibithulhu",2,prize,badConsequence);


      #El sopor de Dunwich
      badConsequence = 
        BadConsequence.newLevelSpecificTreasures("El primordial bostezo contagioso.Pierdes el calzado visible",
        0,[TreasureKind::SHOES],nil)
        prize = Prize.new(1,1)
        @unusedMonsters << Monster.new("El sopor de Dunwich",2,prize,badConsequence);


      #El gorron en el umbral
        badConsequence =
          BadConsequence.newLevelNumberOfTreasures("Pierdes todos tus tesoros visibles",badConsequence.MAXTREASURES,0,0);
        prize = Prize.new(3,1)
        @unusedMonsters << Monster.new("El gorron en el umbral",10,prize,badConsequence)


      #H.P. Munchraft
      badConsequence =
        BadConsequence.newLevelSpecificTreasures("Pierdes la armadura visible",0,
        [TreasureKind::ARMOR],nil)
        prize = Prize.new(2,1)
        @unusedMonsters << Monster.new("H.P. Munchraft",6,prize,badConsequence)


      #Bichgooth
      badConsequence = 
        BadConsequence.newLevelSpecificTreasures("Sientes bichos bajo la ropa. Descarta la armadura visible", 0,
        [TreasureKind::ARMOR], nil)
        prize = Prize.new(1,1)
        @unusedMonsters << Monster.new("Bichogooth",2,prize,badConsequence)

      #La que redacta en las tinieblas
      badConsequence =
        BadConsequence.newLevelNumberOfTreasures("Toses los pulmones y pierdes 2 niveles", 2,0,0)
        prize = Prize.new(1,1)
        @unusedMonsters << Monster.new("La redacta de las tinieblas",2,prize,badConsequence)

      #Los hondos
      badConsequence =
        BadConsequence.newDeath("Estos monstruos resultan bastante superficiales y te aburren mortalmente",1)
        prize = Prize.new(2,1)
        @unusedMonsters << Monster.new("Los hondos",8,prize,badConsequence)

      #Semillas Cthulhu
      badConsequence = 
        BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles y 2 tesoros ocultos",2,0,2)
        prize = Prize.new(2,1)
        @unusedMonsters << Monster.new("Semillas Cthulhu",4,prize,badConsequence)

      #Dameargo
      badConsequence =
        BadConsequence.newLevelSpecificTreasures("Te intentas escaquear. Pierdes una mano visible",0,
        [TreasureKind::ONEHAND],nil)
        prize = Prize.new(2,1)
        @unusedMonsters << Monster.new("Dameargo",1,prize,badConsequence)

      #Pollipólipo volante
      badConsequence = 
        BadConsequence.newLevelNumberOfTreasures("Da mucho asquito. Pierdes 3 niveles",3,0,0)
        prize = Prize.new(1,1)
        @unusedMonsters << Monster.new("Pollipólipo volante",3,prize,badConsequence)

      #Yskhtihyssg- Goth
      badConsequence = 
        BadConsequence.newDeath("No le hace gracia que pronuncien mal su nombre. Estas muerto",1)
        prize = Prize.new(3,1)
        @unusedMonsters << Monster.new("Yskhtihyssg- Goth",12,prize,badConsequence)

      #Familia feliz
      badConsequence =
        BadConsequence.newDeath("La familia te atrapa,estas muerto",1)
        prize = Prize.new(4,1)
        @unusedMonsters << Monster.new("Familia feliz",1,prize,badConsequence)

      #Roboggoth
      badConsequence = 
        BadConsequence.newLevelSpecificTreasures("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible",0,
        [TreasureKind::BOTHHANDS],nil)
        prize = Prize.new(2,1)
        @unusedMonsters << Monster.new("Roboggoth",8,prize,badConsequence)

      #El espia
      badConsequence =
        BadConsequence.newLevelSpecificTreasures("Te asusta en la noche. Pierdes un casco visible",0,
        [TreasureKind::HELMET],nil)
        prize = Prize.new(1,1)
        @unusedMonsters << Monster.new("El espia",5,prize,badConsequence)

      #El Lenguas
      badConsequence = 
        BadConsequence.newLevelNumberOfTreasures("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles",2,5,0)
        prize = Prize.new(1,1)
        @unusedMonsters << Monster.new("El lenguas",20,prize,badConsequence)

      #Bicéfalo
      badConsequence = 
        BadConsequence.newLevelNumberOfTreasures("Te faltan manos para tanto cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos",3,5,0)
        prize = Prize.new(1,1)
        @unusedMonsters << Monster.new("Bicéfalo",20,prize,badConsequence) 
        
      badConsequence =
        BadConsequence.newLevelSpecificTreasures("Pierdes 1 mano visible", 0,[TreasureKind::ONEHAND],nil)
      prize = Prize.new(3, 1)
        @unusedMonsters << Monster.newCultistMonster("El mal indecible impronunciable",10,prize,badConsequence,-2)
        
      badConsequence =
        BadConsequence.newLevelNumberOfTreasures("Pierdes tus tesoros visibles. Ja ja ja", 0,5,0)
      prize = Prize.new(2, 1)
        @unusedMonsters << Monster.newCultistMonster("Testigos Oculares",6,prize,badConsequence,+2)
        
      badConsequence =
        BadConsequence.newDeath("Hoy no es tu dia de suerte. Mueres",1)
      prize = Prize.new(2, 5)
        @unusedMonsters << Monster.newCultistMonster("El gran cthulhu",20,prize,badConsequence,+4)
        
      badConsequence =
        BadConsequence.newLevelNumberOfTreasures("Tu gobierno te recorta 2 niveles", 2,0,0)
      prize = Prize.new(2, 1)
        @unusedMonsters << Monster.newCultistMonster("Serpiente Politico",8,prize,badConsequence,-2)
        
    
    #poner lo que pierdes
    spv=Array.new
    spv << [TreasureKind::HELMET]
    spv << [TreasureKind::ARMOR]
    
    sph=Array.new  
    sph << [TreasureKind::BOTHHANDS]
    sph << [TreasureKind::ONEHAND]
    sph << [TreasureKind::ONEHAND]
      badConsequence =
        BadConsequence.newLevelSpecificTreasures("Pierdes tu casco y tu armadura visible. Pierdes tus manos ocultas", 
        0,spv,sph)
      prize = Prize.new(1, 1)
        @unusedMonsters << Monster.newCultistMonster("Felpuggoth",2,prize,badConsequence,+5)
        
      badConsequence =
        BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles", 2,0,0)
      prize = Prize.new(4, 2)
        @unusedMonsters << Monster.newCultistMonster("Shoggoth",16,prize,badConsequence,-4)
        
      badConsequence =
        BadConsequence.newLevelNumberOfTreasures("Pintalabios negro. Pierdes 2 niveles", 2,0,0)
      prize = Prize.new(1, 1)
        @unusedMonsters << Monster.newCultistMonster("Lolitagooth",2,prize,badConsequence,+3)
   
  end
  
  def shuffleTreasures
    @unusedTreasures.shuffle!
  end
  
  def shuffleMonsters
    @unusedMonsters.shuffle!
  end
  
  public 
  
  def nextTreasure
    if @unusedTreasures.size==0
      @usedTreasures.each do |tre|
        @unusedTreasures << tre
      end
      shuffleTreasures()
      @usedTreasures.clear
    end
    salida =@unusedTreasures.at(0)
    @unusedTreasures.delete_at(0)
    return salida
  end
  
  def nextMonster
    if @unusedMonsters.size==0
      @unusedMonsters=@usedMonsters
      shuffleMonsters()
      @usedMonsters.clear
    end
    salida =@unusedMonsters.at(0)
    @unusedMonsters.delete(salida)
    return salida
  end
  
  def giveTreasureBack(t)
    @usedTreasures<<t
  end
  
  def giveMonsterBack(m)
    @usedMonsters<<m
  end
  
  def initCards
    initTreasureCardDeck()
    shuffleTreasures()
    initMonsterCardDeck()
    shuffleMonsters()
    initCultistCardDeck()
    shuffleCultist()
  end
  
  private
  def shuffleCultist()
    @unusedCultist.shuffle!
  end
  
  def initCultistCardDeck()
    @unusedCultist << Cultist.new("Sectario +1 por cada sectario en juego. No puedes dejar de ser sectario",+1)
    @unusedCultist << Cultist.new("Sectario +2 por cada sectario en juego. No puedes dejar de ser sectario",+2)
    @unusedCultist << Cultist.new("Sectario +1 por cada sectario en juego. No puedes dejar de ser sectario",+1)
    @unusedCultist << Cultist.new("Sectario +2 por cada sectario en juego. No puedes dejar de ser sectario",+2)
    @unusedCultist << Cultist.new("Sectario +1 por cada sectario en juego. No puedes dejar de ser sectario",+1)
    @unusedCultist << Cultist.new("Sectario +1 por cada sectario en juego. No puedes dejar de ser sectario",+1)
      
  end
  
  public
  def nextCultist
    res=@unusedCultist.at(0)
    @unusedCultist.delete_at(0)
    return res
  end
  
  def getRandomUnusedMonster()
    if (@unusedMonster.size !=0)
        
        aleatorio=rand(@unusedMonster.length)
        aux=@unusedMonster.at(aleatorio)
        return aux
    end
    return nil
  end
end
end