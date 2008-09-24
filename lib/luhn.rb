#
# Luhn checksum algorithm, credit card generation and validation
#
class Luhn
  # returns the Luhn checksum 
  def self.checksum(str)
    a = str.split('').map{|c| c.to_i}.reverse
    sum = 0
    (0...a.length).each do |i|
      if i % 2 == 0 # even indices
        sum += a[i]
      else          # odd indices
        sum += (a[i]<5) ? 2*a[i] : 2*a[i]-9
      end
    end
    sum % 10
  end

  # a valid credit card number is one whose Luhn checksum = 0
  def self.checksum_valid?(str)
    checksum(str) == 0
  end

  # generate a random valid credit card number
  def self.generate(type = :visa)
    prefix = {:visa => '4', :mast => '51', :amex => '34', :disc => '6011'}
    length = {:visa => 16, :mast => 16, :amex => 15, :disc => 16}
    # first append random 10 digits which will always be necessary, and 
    # because the maximum number of digits has more entropy than rand
    num = sprintf("%s%.10d", prefix[type], (rand * 10**10).to_i)
    # calculate the necessary remaining digits, not including checksum
    rem = length[type] - prefix[type].length - 10 - 1
    fmt = "%.#{rem}d"
    num += sprintf(fmt, (rand * 10**rem).to_i)
    # calculate the checksum if were to end in '0'
    chk = checksum(num+'0')
    # puts "num = #{num}, chk = #{chk}"
    # correct to be 0 % 10 format
    num + ((10 - chk) % 10).to_s
  end
end
