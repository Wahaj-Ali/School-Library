require './person'

class Student < Person
  attr_reader :classroom, :type

  def initialize(age, classroom, name, parent_permission, type = 'Student')
    super(age, name, parent_permission)
    @classroom = classroom
    @type = type
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.includes?(self)
  end
end
