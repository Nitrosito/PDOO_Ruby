# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiGame

class DeathBC < NumericBC
  def initialize(text,muerte)
    super(text, 0, @@MAXTREASURES, @@MAXTREASURES);
    @death=muerte
  end
  public_class_method :new
  attr_reader :death
  end
end