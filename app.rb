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
end
