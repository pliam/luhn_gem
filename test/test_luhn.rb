require 'test/unit'
require File.join(File.dirname(__FILE__), '..', 'lib', 'luhn')

class TestLuhn < Test::Unit::TestCase # :nodoc:
  # test known values
  def test_known
    # NOTE: Not real cards!
    # these were published along with the algorithm pseudo-code
    known_cards = <<-END
      5399968743187425
      5259837247233655
      5106006793125096
      5129278116353597
      5258318385227578
      5430821984520492
      5569022297971778
      5556218358555170
      5284204002170649
      5311629987543625
      4916001501728797
      4485841726253415
      4539521672754527
      4485717880506857
      4916916734279518
      4485509415474051
      4556457181360886
      4556825130234388
      4556295690272089
      4716115528861761
END
    # check the checksums and validity
    known_cards.split.each do |num|
      assert_equal 0, Luhn.checksum(num), "card: #{num} invalid"
      assert Luhn.checksum_valid?(num), "card: #{num} invalid"
    end
  end
  
  # check checksum validity of generated cards
  def test_generation
    %w{visa mast amex disc}.map{|str| str.to_sym}.each do |type|
      num = Luhn.generate(type)
      assert Luhn.checksum_valid?(num), "#{type.to_s} card: #{num} invalid"
    end
  end
end
