=begin
puts "What is your first name?"
first = gets.chomp
puts "What is your middle name?"
middle = gets.chomp
puts "What is your last name?"
last = gets.chomp

puts "Here is your last name: #{last}"
=end

puts "What is your favorite number?"
num = gets.chomp
new_num = num.to_i
new_num += 1


puts 'This is a bigger better favorite number!' + new_num.to_s
