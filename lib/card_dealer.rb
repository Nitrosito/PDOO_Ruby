# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class CardDealer
  include singleton
  
  def initializer
    @unusedMonster
    @usedMonster
    @unusedTreasures
    @usedTreasures    
  end
  
  def initTreasureCardDeck
  
  end
  
  def initMonsterCardDeck
          #El rey de la rosa
      price =Prize.new(4,2)
      badConsequence =
        BadConsequence.newLevelNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles",5,3,0)
        unusedMonster << Monster.new("El rey de la rosa",13,price,badConsequence)

      # Angeles de la noche ibicenca
      badConsequence =
        BadConsequence.newLevelSpecificTreasures("Te atrapan para llevarte de fiesta y te dejan 
      caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta",0,
      [TreasureKind::ONEHAND],
      [TreasureKind::ONEHAND])
      prize = Prize.new(4,1)
      unusedMonster << Monster.new("Angeles de la noche ibicenca",14,prize,badConsequence);


      # Byakhees de bonanza
      badConsequence = 
         BadConsequence.newLevelSpecificTreasures("Pierdes tu armadura visible y otra oculta", 0,
         [TreasureKind::ONEHAND],
         [TreasureKind::ONEHAND])
         prize= Prize.new(2, 1)
         unusedMonster << Monster.new("Byakhess de bonanza",8,prize,badConsequence)


      #Chibithulhu
      badConsequence = 
        BadConsequence.newLevelSpecificTreasures("Embobados con el lindo primigenio
       te descartas de tu casco visible",0,[TreasureKind::HELMET],nil)
      prize = Prize.new(1, 1)
      unusedMonster << Monster.new("Chibithulhu",2,prize,badConsequence);


      #El sopor de Dunwich
      badConsequence = 
        BadConsequence.newLevelSpecificTreasures("El primordial bostezo contagioso.Pierdes el calzado visible",
        0,[TreasureKind::SHOES],nil)
        prize = Prize.new(1,1)
        unusedMonster << Monster.new("El sopor de Dunwich",2,prize,badConsequence);


      #El gorron en el umbral
        badConsequence =
          BadConsequence.newLevelNumberOfTreasures("Pierdes todos tus tesoros visibles",5,0,0);
        prize = Prize.new(3,1)
        unusedMonster << Monster.new("El gorron en el umbral",10,prize,badConsequence)


      #H.P. Munchraft
      badConsequence =
        BadConsequence.newLevelSpecificTreasures("Pierdes la armadura visible",0,
        [TreasureKind::ARMOR],nil)
        prize = Prize.new(2,1)
        unusedMonster << Monster.new("H.P. Munchraft",6,prize,badConsequence)


      #Bichgooth
      badConsequence = 
        BadConsequence.newLevelSpecificTreasures("Sientes bichos bajo la ropa. Descarta la armadura visible", 0,
        [TreasureKind::ARMOR], nil)
        prize = Prize.new(1,1)
        unusedMonster << Monster.new("Bichogooth",2,prize,badConsequence)

      #La que redacta en las tinieblas
      badConsequence =
        BadConsequence.newLevelNumberOfTreasures("Toses los pulmones y pierdes 2 niveles", 2,0,0)
        prize = Prize.new(1,1)
        unusedMonster << Monster.new("La redacta de las tinieblas",2,prize,badConsequence)

      #Los hondos
      badConsequence =
        BadConsequence.newDeath("Estos monstruos resultan bastante superficiales y te aburren mortalmente")
        prize = Prize.new(2,1)
        unusedMonster << Monster.new("Los hondos",8,prize,badConsequence)

      #Semillas Cthulhu
      badConsequence = 
        BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles y 2 tesoros ocultos",2,0,2)
        prize = Prize.new(2,1)
        unusedMonster << Monster.new("Semillas Cthulhu",4,prize,badConsequence)

      #Dameargo
      badConsequence =
        BadConsequence.newLevelSpecificTreasures("Te intentas escaquear. Pierdes una mano visible",0,
        [TreasureKind::ONEHAND],nil)
        prize = Prize.new(2,1)
        unusedMonster << Monster.new("Dameargo",1,prize,badConsequence)

      #Pollipólipo volante
      badConsequence = 
        BadConsequence.newLevelNumberOfTreasures("Da mucho asquito. Pierdes 3 niveles",3,0,0)
        prize = Prize.new(1,1)
        unusedMonster << Monster.new("Pollipólipo volante",3,prize,badConsequence)

      #Yskhtihyssg- Goth
      badConsequence = 
        BadConsequence.newDeath("No le hace gracia que pronuncien mal su nombre. Estas muerto")
        prize = Prize.new(3,1)
        unusedMonster << Monster.new("Yskhtihyssg- Goth",12,prize,badConsequence)

      #Familia feliz
      badConsequence =
        BadConsequence.newDeath("La familia te atrapa")
        prize = Prize.new(4,1)
        unusedMonster << Monster.new("Familia feliz",1,prize,badConsequence)

      #Roboggoth
      badConsequence = 
        BadConsequence.newLevelSpecificTreasures("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible",0,
        [TreasureKind::BOTHHANDS],nil)
        prize = Prize.new(2,1)
        unusedMonster << Monster.new("Roboggoth",8,prize,badConsequence)

      #El espia
      badConsequence =
        BadConsequence.newLevelSpecificTreasures("Te asusta en la noche. Pierdes un casco visible",0,
        [TreasureKind::HELMET],nil)
        prize = Prize.new(1,1)
        unusedMonster << Monster.new("El espia",5,prize,badConsequence)

      #El Lenguas
      badConsequence = 
        BadConsequence.newLevelNumberOfTreasures("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles",2,5,0)
        prize = Prize.new(1,1)
        unusedMonster << Monster.new("El lenguas",20,prize,badConsequence)

      #Bicéfalo
      badConsequence = 
        BadConsequence.newLevelNumberOfTreasures("Te faltan manos para tanto cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos",3,5,0)
        prize = Prize.new(1,1)
        unusedMonster << Monster.new("Bicéfalo",20,prize,badConsequence) 
  end
  
  def shuffleTreasures
    
  end
  
  def shuffleMonsters
    
  end
  
  public 
  
  def nextTreasure
  
  end
  
  def nextMonster
    
  end
  
  def giveTreasureBack(t)
    @usedTreasures.push(t)
  end
  
  def giveMonsterBack(m)
    @usedMonsters.push(m)
  end
  
  def initCards
    
  end
  
  
  
end
