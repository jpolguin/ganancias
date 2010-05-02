require File.dirname(__FILE__) + '/../test_helper'

class RevenueTaxTest < Test::Unit::TestCase
  

  
  def test_find_applied_tax
    assert_in_delta(0.00,RevenueTax.find_applied_tax(:enero,185)["tax_amount"],0.01)
    assert_in_delta(75.00,RevenueTax.find_applied_tax(:enero,933.98)["tax_amount"],0.01)
    assert_in_delta(4625.00,RevenueTax.find_applied_tax(:mayo,26777)["tax_amount"],0.01)
    assert_in_delta(6475.00,RevenueTax.find_applied_tax(:julio,50000.45)["tax_amount"],0.01)
    
    assert_in_delta(0.09,RevenueTax.find_applied_tax(:enero,185)["tax_rate"],0.01) 
    
    assert_in_delta(37500,RevenueTax.find_applied_tax(:mayo,40000)["from_salary"],0.01) 
    assert_in_delta(7500,RevenueTax.find_applied_tax(:septiembre,10000.0)["from_salary"],0.01) 
    
  end
  
  def test_revenue_tax_amount
    assert_in_delta(0.00,RevenueTax.total_tax(:enero,-183.67),0.01)
    assert_in_delta(16.53,RevenueTax.total_tax(:enero,183.67),0.01)
    assert_in_delta(33.06,RevenueTax.total_tax(:febrero,367.33),0.01)
    
    assert_in_delta(181.83,RevenueTax.total_tax(:noviembre,2020.33),0.01)
    assert_in_delta(468.36,RevenueTax.total_tax(:diciembre,5204),0.01)
    
    
  end
  
  
end
