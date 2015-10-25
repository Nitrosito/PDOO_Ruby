# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Prize
  def initialize(treasures, level)
    @treasures = treasures
    @level = level
  end
  
  attr_accessor :treasures, :level
  
  def to_s
    "Buen rollo
          Tesoros: #{@treasures}
          Nivel: #{@level}\n"
  end
end
