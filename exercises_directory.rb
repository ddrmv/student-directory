def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit Return twice"
    # create an empty array
    students = []
    # get the first name
    
    # while the name is not empty, repeat this code
    loop do
        puts "Enter name: "
        name = gets.chomp
        # stop entry and return the list on empty name entry
        break if name.empty?

        puts "Enter cohort: "
        cohort = gets.chomp
        cohort = cohort.empty? ? "?".to_sym : cohort.to_sym

        puts "Enter hobbies: "
        hobbies = gets.chomp
        hobbies = hobbies.empty? ? "?".to_sym : hobbies.to_sym

        puts "Enter country of birth: "
        country = gets.chomp
        country = country.empty? ? "?".to_sym : country.to_sym

        puts "Enter height: "
        height = gets.chomp
        height = height.empty? ? "?".to_sym : height.to_sym
        
        students << {name: name, cohort: cohort, hobbies: hobbies,
                     country: country, height: height}
        puts "Now we have #{students.count} students"
        # get another name from the user
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
    index = 0
    counter = 1
    while index < students.length do
    student = students[index]
        if ((student[:name][0].downcase == letter.downcase ||
            letter.empty?) && student[:name].length < 12)
            puts "#{counter}. #{student[:name]}: cohort: #{student[:cohort]}; " +
                 "hobbies: #{student[:hobbies]}; country: #{student[:country]}; " +
                 "height: #{student[:height]}"
            counter += 1
        end
    index += 1
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
