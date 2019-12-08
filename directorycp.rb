@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #get the first name
  name = gets.gsub(/\n/, "")
  #whilst the name is not empty, repeat this code
  while !name.empty? do
    puts "What is students cohort"
    cohort = gets.gsub(/\n/, "")
    puts "What is students height"
    height = gets.gsub(/\n/, "")
    puts "What is students weight"
    weight = gets.gsub(/\n/, "")
    height = :unknown if height.empty?
    cohort = :unknown if cohort.empty?
    weight = :unknown if weight.empty?
    # add the student hash to the array
    @students << {name: name, cohort: cohort, height: height, weight: weight}
    puts "Now we have #{@students.count} students"
    #get another name from the user
    name = gets.gsub(/\n/, "")
  end
  #return the array of students
  @students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students_by_cohort = {}

  students.each do |student|
    cohort = student[:cohort]
    name = student[:name]

    students_by_cohort[cohort] ||= []

    students_by_cohort[cohort].push(name)
  end
  students_by_cohort.each do |cohort, names|
    puts "Students for #{cohort}: #{names.join(" ,")}"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great student#{'s' unless names.count == 1}"
end

def interactive_menu

  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      @students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
students = input_students
#nothing happens until we call the methods
print_header
print(@students) unless @students.empty?
print_footer(@students)
