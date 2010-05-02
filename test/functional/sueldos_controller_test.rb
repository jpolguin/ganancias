require File.dirname(__FILE__) + '/../test_helper'
require 'sueldos_controller'

# Re-raise errors caught by the controller.
class SueldosController; def rescue_action(e) raise e end; end

class SueldosControllerTest < Test::Unit::TestCase
  def setup
    @controller = SueldosController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
