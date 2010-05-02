class UpdateReductionPercentage < ActiveRecord::Migration
  def self.up
    ReductionTax.update_all "reduction_percentage=0.0", true 
  end

  def self.down
    AddReductionTaxes.up
  end
end
