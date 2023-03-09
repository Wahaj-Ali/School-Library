require './student'
require './teacher'
require './book'
require './rental'

class App
  attr_reader :books, :persons, :rentals

  def initialize()
    @books = []
    @persons = []
    @rentals = []
  end

  # list methods
  def list_people
    if persons.length.positive?
      @persons.each_with_index do |person, index|
        print "\n [#{index}] [#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    else
      puts "\nNo persons found"
    end
  end

  def list_books
    if books.length.positive?
      @books.each_with_index do |book, index|
        print "\n [#{index}] [#{book}] Title: #{book.title}, Author: #{book.author}"
      end
    else
      puts "\nNo books found"
    end
  end

  # create methods
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    number = gets.chomp
    case number
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts '\nSelect a valid option'
      nil
    end
  end

  def create_student
    print 'Age: '
    student_age = gets.chomp
    print 'Name: '
    student_name = gets.chomp.capitalize
    print 'Has parent permisiion? [Y/N]:'
    student_parent_permission = gets.chomp
    permission = case student_parent_permission.downcase
                 when 'y'
                   true
                 when 'n'
                   false
                 end
    print 'Classroom: '
    student_classroom = gets.chomp
    add_student(student_age, student_classroom, student_name, permission)
    print "\nStudent created successfully.\n"
  end

  def add_student
    new_student = Student.new(student_age, student_classroom, student_name, permission)
    @persons << new_student
  end

  def create_teacher
    print 'Age: '
    teacher_age = gets.chomp
    print 'Name: '
    teacher_name = gets.chomp
    print 'Specialization: '
    teacher_specialization = gets.chomp
    add_teacher(teacher_age, teacher_specialization, teacher_name)
    print "\nTeacher created successfully.\n"
  end

  def add_teacher
    new_teacher = Teacher.new(teacher_age, teacher_specialization, teacher_name)
    @persons << new_teacher
  end
end
