class Person
    def initialize(parent_permission: true, age, name = 'Unknown')
      @id = Random.rand(1..1000)
      @name = name
      @age = age
    end

    attr_accessor :name, :age
    attr_reader :id

    def is_of_age?
        @age >= 18
    end

    def can_use_services?
        is_of_age? || parent_permission?
    end

    private :is_of_age?
  end