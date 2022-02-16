def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp

  while !name.empty? do
    puts "What are #{name}'s hobbies?"
    hobbies = gets.chomp
    puts "What is #{name}'s country of birth?"
    country = gets.chomp
    puts "How tall is #{name}?"
    height = gets.chomp
    
    students << {name: name, cohort: :november, hobbies: hobbies, country: country, height: height}
    puts "Now we have #{students.count} students"

    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "---------------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)