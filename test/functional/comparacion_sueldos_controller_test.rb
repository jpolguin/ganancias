require File.dirname(__FILE__) + '/../test_helper'
require 'comparacion_sueldos_controller'

# Re-raise errors caught by the controller.
class ComparacionSueldosController; def rescue_action(e) raise e end; end

class ComparacionSueldosControllerTest < Test::Unit::TestCase
  def setup
    @controller = ComparacionSueldosController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
