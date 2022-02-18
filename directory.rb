@students = [] # an empty array accessible to all methods

def students_to_hash(name, cohort= "november")
    @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  @students = []
  name = STDIN.gets.chomp

  while !name.empty? do
    students_to_hash(name)
    puts "Now we have #{@students.count} students"

    name = STDIN.gets.chomp
  end
  @students
end

def interactive_menu
  loop do 
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to .csv"
  puts "4. Load the list from .csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1" then @students = input_students
    when "2" then show_students
    when "3" then save_students
    when "4" then load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "---------------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  require 'csv'
  # ask to input filename
  puts "Please provide filename:"
  filename = STDIN.gets.chomp
  # open the file for writing
  file = CSV.open(filename, "w") do |file|
  # iterate over the array of students
    @students.each do |student|
      file << [student[:name], student[:cohort]]
    end
  end
  puts "students saved to #{filename}"
end

def load_students
  require 'csv'
  # ask to input filename
  puts "Please provide filename:"
  filename = STDIN.gets.chomp
  file = CSV.foreach(filename, "r") do |row|
    name, cohort = row
    students_to_hash(name, cohort)
  end
  puts "students loaded from #{filename}"
end

# def load_students
#   # ask to input filename
#   puts "Please provide filename:"
#   filename = STDIN.gets.chomp
#   file = File.open(filename, "r") do |file|
#     file.readlines.each do |line|
#     name, cohort = line.chomp.split(',')
#     students_to_hash(name, cohort)
#     end
#   end
#   puts "students loaded from #{filename}"
# end

def try_load_students
  filename = ARGV.first  # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end


try_load_students
interactive_menu