require File.dirname(__FILE__) + '/../test_helper'
require 'salary_controller'

# Re-raise errors caught by the controller.
class SalaryController; def rescue_action(e) raise e end; end

class SalaryControllerTest < Test::Unit::TestCase
  def setup
    @controller = SalaryController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_calculate_tax
    get :calcular_ganancia, :id => 9
    assert_not_nil assigns["anual_salary" ]
  end
end
