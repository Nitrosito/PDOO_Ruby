# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Treasure
  def initialize(n, bonus, t)
    @name=n
    @bonus=bonus
    @type=t
  end
  
  attr_reader :name, :bonus, :type
end
#
##encoding: utf-8
## To change this license header, choose License Headers in Project Properties.
## To change this template file, choose Tools | Templates
## and open the template in the editor.
#  require 'singleton'
#  require_relative 'treasure.rb'
#  require_relative 'treasure_kind.rb'
#  require_relative 'monster.rb'
#  require_relative 'prize.rb'
#  require_relative 'bad_consequence.rb'
#  class CardDealer
#
#    include Singleton
#    
#    private
#    def initialize
#      @unusedTreasures = Array.new
#      @usedTreasures = Array.new
#      @usedMonsters = Array.new
#      @unusedMonsters = Array.new
#    end
