def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #whilst the name is not empty, repeat this code
  while !name.empty? do
    puts "What is students cohort"
    cohort = gets.chomp
    puts "What is students height"
    height = gets.chomp
    puts "What is students weight"
    weight = gets.chomp
    height = :unknown if height.empty?
    cohort = :unknown if cohort.empty?
    weight = :unknown if weight.empty?
    # add the student hash to the array
    students << {name: name, cohort: cohort, height: height, weight: weight}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
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
  puts "Overall, we have #{names.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
