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
 
  students_by_cohort = {}

  students.each do |student|
    cohort = student[:cohort]  

    if students_by_cohort[cohort] == nil
      students_by_cohort[cohort] = []
    end  
  
    students_by_cohort[cohort].push(student[:name])
  end
  
  students_by_cohort.each do |cohort, name|
    puts "#{cohort}: #{name.join(', ')}"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
  
print_header
print(students)
print_footer(students)