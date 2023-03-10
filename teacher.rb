require './person'
class Teacher < Person
  attr_reader :type
  attr_accessor :specialization

  def initialize(name, age, specialization, type = 'Teacher')
    super(age, name, parent_permission)
    @specialization = specialization
    @type = type
  end

  def can_use_services?
    true
  end
end
