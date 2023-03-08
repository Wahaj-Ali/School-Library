require './nameable'
require './base_decorator'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  attr_reader :rentals, :id

  def initialize(age, name = 'Unknown', _parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @rentlas = []
  end

  def add_rentals(rental)
    @rentals.push(rental)
  end

  attr_accessor :name, :age

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || parent_permission?
  end

  def correct_name
    @name
  end
  private :of_age?
end


person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmed_person.correct_name
