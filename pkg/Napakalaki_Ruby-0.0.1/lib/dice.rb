# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'singleton'
module NapakalakiGame
class Dice
  include Singleton

  def nextNumber
    numero= %w{1 2 3 4 5 6}
    return rand(numero.length)
  end
  
end
end
