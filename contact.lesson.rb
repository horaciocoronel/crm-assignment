class Contact

  @@contacts = []
  @@next_id = 1000

  def self.create(first_name, last_name, email, notes = 'N/A')
    new_contact = Contact.new(first_name, last_name, email, notes)
    @@contacts << new_contact
    new_contact
  end

  def self.all
    @@contacts
  end

  def self.find(id)
    # Exercise left to the student
    # Iterate through @@contacts, find the specific instance denoted by id
    # Return the specific instance being looked for
  end
  def initialize(first_name, last_name, email, notes = 'N/A')
    @first_name = first_name
    @last_name  = last_name
    @email      = email
    @notes      = notes

    @id = @@next_id
    @@next_id += 1
  end
# READERS
  def first_name
    @first_name
  end

  def last_name
    @last_name
  end
  def email
    @email
  end

  def notes
    @notes
  end
  # WRITERS
    def first_name(first_name)
      @first_name = first_name
    end

    def last_name(last_name)
      @last_name = last_name
    end
    def email(email)
      @email = email
    end

    def notes(notes)
      @notes =  notes
    end

  # INSTANCE METHODS
  def full_name
    "#{ first_name } #{ last_name }"
  end
end


# dave = Contact.new('Dave', 'Wong', 'dave@gmail.com')
# clark = Contact.new('Clark', 'Kent', 'clark@dailyplanet.com', 'goes into the phone booth a lot')
