def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit Return twice"
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
        # add the student hash to the array
        cohort_of_student = :november
        students << {name: name, cohort: cohort_of_student}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
    end
    # return the array of students
    students
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def select_letter
    puts "Select which names to print, starting with letter,"
    puts "press Enter to print all"
    gets.chomp
end

def print(students, letter)
    students.each_with_index do |student, index|
        if (student[:name][0].downcase == letter.downcase ||
            letter.empty?)
            puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
        end
    end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end

# nothing happens until we call the methods
students = input_students
letter_to_print = select_letter
print_header
print(students, letter_to_print)
print_footer(students)
