# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'treasure_kind.rb'

class Treasure
  def initialize(n, bonus, t)
    @name=n
    @bonus=bonus
    @type=t
  end
  
  attr_reader :name, :bonus, :type
  
end
