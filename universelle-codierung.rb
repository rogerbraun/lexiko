require "test/unit"
 
module Enumerable
  alias :fold :inject
end

def encode(arr)
  arr.map{|n| encode_helper n}.flatten
end

def encode_helper(n)
  ([1] * n) + [0]
end

def decode(arr)
  arr.fold([[],0]) do |r,v|
    if v == 0 then
      [r[0] + [r[1]],0]
    else
      [r[0],r[1] + 1]
    end
  end.first
end


class TestUniversalCode < Test::Unit::TestCase

  def test_encode
    assert_equal encode([1, 2, 3]), [1,0,1,1,0,1,1,1,0] 
    assert_equal encode([0,0,3]), [0,0,1,1,1,0]
  end

  def test_decode
    assert_equal decode([1,0,1,1,0,1,1,1,0]), [1, 2, 3]
    assert_equal decode([0,0,1,1,1,0]), [0, 0, 3]
  end
 
end
