require File.dirname(__FILE__) + '/../test_helper'

class MonthlySalaryTest < Test::Unit::TestCase
 # fixtures :monthly_salaries

  # Replace this with your real tests.
  def test_new_from_data
    monthlySalary = MonthlySalary.new_from_data(:marzo, 5000, 100.3, 0)
    assert_equal :marzo, monthlySalary.month
    assert_in_delta 5000.0, monthlySalary.gross_salary, 0.001
    assert_in_delta 100.3, monthlySalary.ticket, 0.001
    assert_in_delta 0.0, monthlySalary.bonus, 0.001
  end
  
  def test_hash_parametros
    params = {
    :salario_mes =>{"6"=>{"ticket"=>"200.0", "gross_salary"=>"1000", "bonus"=>"5.0"},
                    "11"=>{"ticket"=>"200.0", "gross_salary"=>"1000", "bonus"=>"5.0"}
                   }                    
    }
    
    salariosMensuales = []
    theSalary = Salary.new(:position_id => 3, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false)
      theSalary.set_monthly_salary_for_all_months(5000)
    
    params[:salario_mes].each_key  do | indiceMes |
      datos_salario = params[:salario_mes][indiceMes]
      salario_mensual_completo = MonthlySalary.new_from_data(Salary::MONTHS[indiceMes.to_i],
                                               datos_salario["gross_salary"].to_f, datos_salario["ticket"].to_f, datos_salario["bonus"].to_f)
      salariosMensuales << salario_mensual_completo
    end
    theSalary.monthly_salaries = salariosMensuales
    assert_equal 2,  salariosMensuales.length
    assert_in_delta 1000,  salariosMensuales[1].gross_salary , 0.001
    assert_equal 2, theSalary.monthly_salaries.length
  end
  
end
