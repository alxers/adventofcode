require 'digest'

input = 'iwrupvqb'
#input = 'abcdef'

i = 346386

loop do
  str = input + i.to_s
  hash = Digest::MD5.hexdigest str
  if hash.start_with? '000000'
    puts hash
    puts i
    break
  end
  i += 1
end
