def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  
  students = []
  name = gets.chomp
  name = "unknown" if name.empty?

  puts "Please enter #{name}'s cohort"
  
  possible_cohorts = [
    'january', 'february', 'march', 'april', 'may', 'june', 
    'july', 'august', 'september', 'october', 'november', 'december'
  ]
  
  while true
    cohort = gets.chomp.downcase
    if cohort.empty?
      cohort = "unknown"
      break
    elsif possible_cohorts.include?(cohort)
      cohort
      break
    end
  end
  cohort

  until name == "unknown" && cohort == "unknown" do
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    
    name = gets.chomp
    name = "unknown" if name.empty?

    puts "Please enter #{name}'s cohort"
    while true
      cohort = gets.chomp.downcase
      if cohort.empty?
        cohort = "unknown"
        break
      elsif possible_cohorts.include?(cohort)
        cohort
        break
      end
    end
    cohort
    
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