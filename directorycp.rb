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
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  students_by_cohort = {}
  @students.each do |student|
    cohort = student[:cohort]
    name = student[:name]

    students_by_cohort[cohort] ||= []

    students_by_cohort[cohort].push(name)
  end
  students_by_cohort.each do |cohort, names|
    puts "Students for #{cohort}: #{names.join(" ,")}"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great student#{'s' unless @students.count == 1}"
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interactive_menu
save_students
#nothing happens until we call the methods
