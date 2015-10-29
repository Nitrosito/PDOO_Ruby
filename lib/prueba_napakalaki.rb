  #encondig: utf-8
  require_relative "prize.rb"
  require_relative "bad_consequence.rb"
  require_relative "monster.rb"
  require_relative "treasure_kind.rb"
class PruebaNapakalaki
  def initialize
    
  end
  
end

  # Probando a crear objetos de las clases creadas y consultarlos
   #mimonstruo = Monster.new("Tux", 100, Prize.new(10, 10), BadConsequence.new("meh",3,3,3,3,3,false)) # Creo objeto monstruo
   #puts mimonstruo.name #nombre
   #puts mimonstruo.combatLevel #Nivel

   #miprize = Prize.new(3, 3)
   #puts miprize.level 
   #puts miprize.treasures
   
#Creando un monstruo PRUEBA
# pChibithulhu = Prize.new(1,1)
# bcChibithulhu = BadConsequence.newLevelSpecificTreasures("Embobados con el lindo primigenio te descartas de tu casco visible", 0,[TreasureKind::BOTHHANDS], nil)
# mimonstruo = Monster.new('Chibithulhu',2,pChibithulhu,bcChibithulhu)
# 
#puts mimonstruo.to_s

#Añadiendo monstruos del PDF
monster = Array.new 

#El rey de la rosa
price =Prize.new(4,2)
badConsequence =
  BadConsequence.newLevelNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles",5,3,0)
  monster << Monster.new("El rey de la rosa",13,price,badConsequence)
         
# Angeles de la noche ibicenca
badConsequence =
  BadConsequence.newLevelSpecificTreasures("Te atrapan para llevarte de fiesta y te dejan 
caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta",0,
[TreasureKind::ONEHAND],
[TreasureKind::ONEHAND])
prize = Prize.new(4,1);
monster << Monster.new("Angeles de la noche ibicenca",14,prize,badConsequence);
                    
                    
# Byakhees de bonanza
badConsequence = 
   BadConsequence.newLevelSpecificTreasures("Pierdes tu armadura visible y otra oculta", 0,
   [TreasureKind::ONEHAND],
   [TreasureKind::ONEHAND])
   prize= Prize.new(2, 1)
   monster << Monster.new("Byakhess de bonanza",8,prize,badConsequence)
            

#Chibithulhu
badConsequence = 
  BadConsequence.newLevelSpecificTreasures("Embobados con el lindo primigenio
 te descartas de tu casco visible",0,[TreasureKind::HELMET],nil)
prize = Prize.new(1, 1);
monster << Monster.new("Chibithulhu",2,prize,badConsequence);

            
#El sopor de Dunwich
badConsequence = 
  BadConsequence.newLevelSpecificTreasures("El primordial bostezo contagioso.Pierdes el calzado visible",
  0,[TreasureKind::SHOES],nil)
  prize = Prize.new(1,1);
  monster << Monster.new("El sopor de Dunwich",2,prize,badConsequence);
            
            
#El gorron en el umbral
  badConsequence =
    badConsequence.newLevelNumberOfTreasures("Pierdes todos tus tesoros visibles",5,0,0);
  prize = Prize.new(3,1);
  monster << Monster.new("El gorron en el umbral",10,prize,badConsequence)
            
            
#H.P. Munchraft
badConsequence =
  BadConsequence.newLevelSpecificTreasures("Pierdes la armadura visible",0,
  [TreasureKind::ARMOR],nil)
  prize = Prize.new(2,1);
  monster << Monster.new("H.P. Munchraft",6,prize,badConsequence)
  
            
#Bichgooth
#            badConsequence = new BadConsequence("Sientes bichos bajo la ropa.Descarta la armadura visible",
#            0, new ArrayList(Arrays.asList(TreasureKind.ARMOR)),new ArrayList());
#            prize = new Prize(1,1);
#            monstruos.add(new Monster("Bichgooth",2,badConsequence,prize));
#            
#            
#                //La que redacta en las tinieblas
#            badConsequence = new BadConsequence("Toses los pulmones y pierdes 2 niveles",2,0,0);
#            prize = new Prize(1,1);
#            monstruos.add(new Monster("La que redacta en las tinieblas",2,badConsequence,prize));
#            
#                //Los hondos
#            badConsequence = new BadConsequence("Estos monstruos resultan bastante superficiales  "
#                + "y te aburren mortalmente",true);
#            prize = new Prize(2,1);
#            monstruos.add(new Monster("Los hondos", 8,badConsequence,prize));
#            
#                //Semillas Cthulhu
#            badConsequence = new BadConsequence("Pierdes 2 niveles y 2 tesoros ocultos",2,0,2);
#            prize = new Prize(2,1);
#            monstruos.add(new Monster("Semillas Cthulhu",4,badConsequence,prize));
#            
#                //Dameargo
#            badConsequence = new BadConsequence("Te intentas escaquear.Pierdes una mano visible"
#                    ,0, new ArrayList(Arrays.asList(TreasureKind.ONEHAND)),new ArrayList());
#            prize = new Prize(2,1);
#            monstruos.add(new Monster("Dameargo",1,badConsequence,prize));
#            
#                //Pollipólipo volante
#            badConsequence = new BadConsequence("Da mucho asquito. Pierdes 3 niveles",3,0,0);
#            prize = new Prize(1,1);
#            monstruos.add(new Monster("Pollipólipo volante",3,badConsequence,prize));
#            
#                //Yskhtihyssg- Goth
#            badConsequence = new BadConsequence("No le hace gracia que pronuncien mal su nombre. Estas muerto",true);
#            prize = new Prize(3,1);
#            monstruos.add(new Monster("Yskhtihyssg- Goth",12,badConsequence,prize));
#            
#                //Familia feliz
#            badConsequence = new BadConsequence("La familia te atrapa. Est́as muerto",true);
#            prize = new Prize(4,1);
#            monstruos.add(new Monster("Familia feliz",1,badConsequence,prize));
#            
#                //Roboggoth
#            badConsequence = new BadConsequence("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible"
#            ,0,new ArrayList(Arrays.asList(TreasureKind.BOTHHANDS)),new ArrayList());
#            prize = new Prize(2,1);
#            monstruos.add(new Monster("Roboggoth",8,badConsequence,prize));
#            
#                //El espia
#            badConsequence = new BadConsequence("Te asusta en la noche. Pierdes un casco visible",0
#                    ,new ArrayList(Arrays.asList(TreasureKind.HELMET)),new ArrayList());
#            prize = new Prize(1,1);
#            monstruos.add(new Monster("El espia",5,badConsequence,prize));
#            
#                //El Lenguas
#            badConsequence = new BadConsequence("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles"
#                    ,2,5,0);
#            prize = new Prize(1,1);
#            monstruos.add(new Monster("El Lenguas",20,badConsequence,prize));
#            
#                //Bicéfalo
#             badConsequence = new BadConsequence("Te faltan manos para tanta cabeza. Pierdes" 
#                     +"3 niveles y tus tesoros visibles de las manos",3,5,0);
#            prize = new Prize(1,1);
#            monstruos.add(new Monster("Bicéfalo",20,badConsequence,prize));
#           
puts monster
