require File.dirname(__FILE__) + '/../test_helper'

class ReductionTaxTest < Test::Unit::TestCase

  # Replace this with your real tests.
  def test_find_reduction_tax
    assert_in_delta(0.0, ReductionTax.find_reduction_tax(:enero, 5000.0),0.01)
       
    assert_in_delta(0.5, ReductionTax.find_reduction_tax(:enero, 8000.0),0.01)
    assert_in_delta(0.0, ReductionTax.find_reduction_tax(:junio, 44000.0),0.01)
    assert_in_delta(0.7, ReductionTax.find_reduction_tax(:junio, 66000.0),0.01)
    
    assert_in_delta(0.5, ReductionTax.find_reduction_tax(:agosto, 62345.5), 0.01)
      
    
  end
end
