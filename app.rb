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

  def list_people
    if persons.length.positive?
      @persons.each_with_index do |person, index|
        print "\n [#{index}] [#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    else
      puts "\nNo persons found"
    end
  end
end
