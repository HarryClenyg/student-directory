def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"

    name = gets.chomp
  end
  students
end

def print_header(students)
  if students.count > 0
    puts "The students of Villains Academy"
    puts "---------------------"
  else
  end  
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  if students.count > 0
    puts "Overall, we have #{students.count} great students"
  else
  end  
end

students = input_students
print_header(students)
print(students)
print_footer(students)