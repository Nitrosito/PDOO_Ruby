# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class DeathBC < NumericBC
  def initialize(text,death)
    super(text,0,@@MAXTREASURES,@@MAXTREASURES)
    @death=death
  end
  
  attr_reader :death
  
end
