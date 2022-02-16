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
  
  def print_header
    puts "The students of Villains Academy"
    puts "---------------------"
  end
  
  def print(students)
    puts "Select letter to search for students:"
    $letter = gets.chomp
    $count = 0

    students.each do |student|
      if student[:name][0] == $letter
        puts "Students with names beginning with #{$letter}:"
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
        $count += 1
      else
      end
    end
  end
  
  def print_footer(students)
    puts "Overall, we have #{students.count} great students, of which #{$count} begin with the letter '#{$letter}'"
  end
  
  students = input_students
  print_header
  print(students)
  print_footer(students)