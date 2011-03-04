require 'rubygems'
require 'fastercsv'

data = FasterCSV.read(ARGV[0])

puts data[1][0]

# y=mx+b

normal_data1 = []
normal_data2 = []
avg_data = []

data [1..-1].each do |row|
    normal_data1 << row[0].to_f
    normal_data2 << row[1].to_f
    avg_data << (row[0].to_f + row[1].to_f) / 2.0
end

concentrations = %w{0 0.25 0.5 1 2.5 5 7.5 }.map do |x|
    x.to_f
end

y_points = avg_data
x_points = concentrations

#sum of x
sum_x = 0
x_points.each do |x|
    sum_x = sum_x + x
end

#sum of xx
sum_xx = 0
x_points.each do |x|
    sum_xx = sum_xx + (x * x)
end

#avg x
avg_x = sum_x / x_points.length.to_f

#sum y
sum_y = 0
y_points.each do |y|
    sum_y = sum_y + y
end

#avg y
avg_y = sum_y / y_points.length.to_f

#sum xy = sum(x*y) for all x and y
sum_xy = 0
x_points.each_index do |i|
    sum_xy = sum_xy + (x_points[i] * y_points[i])
end 

#calculate slope
m = (sum_xy - (sum_x * avg_y)) / (sum_xx - (sum_x * avg_x))
b = (avg_y - (m * avg_x))

puts "Slope = #{m}"
puts "Y-intercept = #{b}"

tp = 1
mouse = 1

result = File.open(ARGV[0] + ".result.csv", "w")
result.puts ["Timepoint", "mouse_#", "concentration (ng)"].to_csv

data.each do |r|
    r[2..-1].each_slice(2) do |m_a,m_b|
        avg_m_val = (m_a.to_f + m_b.to_f) / 2.0
        #x = (y-b) / m
        ng = (avg_m_val - b) / m
        result.puts( [ tp, mouse, ng].to_csv )
        tp += 1 #tp = tp + 1
    end
    tp = 1
    mouse += 1
end


