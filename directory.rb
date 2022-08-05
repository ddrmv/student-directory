require 'csv'

@students = []
LINE_LENGTH = 78
DEFAULT_FILENAME = "students.csv"

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit Return twice"
    name = STDIN.gets.chomp
    while !name.empty? do
        @students << {name: name, cohort: :november}
        puts "Now we have #{@students.count} students"
        name = STDIN.gets.chomp
    end
end

def print_header
    puts "The students of Villains Academy"
    puts "-" * LINE_LENGTH
end

def print_students_list
    @students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer
    puts "Overall, we have #{@students.count} great students"
end

def print_menu_feedback(feedback_message)
    puts "-" * LINE_LENGTH
    puts feedback_message
end

def interactive_menu
    loop do
        print_menu
        selection = STDIN.gets.chomp
        case selection
        when "1"
            input_students
            print_menu_feedback "Input of students has concluded."
        when "2"
            show_students
            print_menu_feedback "List of students has been printed."
        when "3"
            save_students(input_filename)
            print_menu_feedback "List of students has been saved."
        when "4"
            try_load_students(input_filename)
            print_menu_feedback "List of students has been loaded."
        when "9"
            print_menu_feedback "Exiting student directory."
            exit
        else
            puts "I don't know what you meant, try again"
        end
    end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to file"
    puts "4. Load the list from file"
    puts "9. Exit"  # 9 because we'll be adding more items
end

def show_students
    print_header
    print_students_list
    print_footer
end

def input_filename
    puts "Enter file name to save to or press enter to use" +
        " '#{DEFAULT_FILENAME}': "
    filename = STDIN.gets.chomp
    filename = DEFAULT_FILENAME if filename.empty?
    filename
end

def save_students(filename)
    CSV.open(filename, "w") do |csv|
        @students.each do |student|
            csv << [student[:name], student[:cohort]]
        end
    end
end

def load_students(filename)
    @students = []
    CSV.foreach(filename) do |line|
        name, cohort = line
        @students << {name: name, cohort: cohort.to_sym}
    end
end

def try_load_students(filename)
    if File.exist?(filename)
        load_students(filename)
        puts "Loaded #{@students.count} from #{filename}"
    elsif filename != DEFAULT_FILENAME
        puts "Sorry, #{filename} doesn't exist"
        exit
    else  # DEFAULT_FILENAME file is used but it did not exist
        File.open(DEFAULT_FILENAME, "w") do |file|
        end
        puts "Default file #{DEFAULT_FILENAME} did not previously exist."
        puts "It has now been created as an empty file."
    end
end

def startup_load_students
    filename = ARGV.empty? ? DEFAULT_FILENAME : ARGV.first
    try_load_students(filename)
end


startup_load_students
interactive_menu
