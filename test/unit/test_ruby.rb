# 
# test_ruby.rb
# 
# Created on 14/02/2008, 17:05:59
# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'

class TestRuby < Test::Unit::TestCase

   
  def test_foo
    # assert_equal("foo", bar)

    # assert, assert_block, assert_equal, assert_in_delta, assert_instance_of,
    # assert_kind_of, assert_match, assert_nil, assert_no_match, assert_not_equal,
    # assert_not_nil, assert_not_same, assert_nothing_raised, assert_nothing_thrown,
    # assert_operator, assert_raise, assert_raises, assert_respond_to, assert_same,
    # assert_send, assert_throws

      mes = :enero
      base = "--- :enero\n"
      assert("aiello" =~ /[aeiou]/ )
      
      assert( base =~ /#{mes}/)
      base2 = :febrero
      mes2 = :febrero
      assert( base2.to_s =~ /#{mes2}/)
  end
end
