gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')


class Contact

  @@contacts = []
  @@next_id  = 100


  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, notes = 'N/A')
    @first_name = first_name
    @last_name  = last_name
    @email      = email
    @note       = notes

    @id = @@next_id
    @@next_id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, notes = 'N/A')
    new_contact = Contact.new(first_name, last_name, email, notes)
    @@contacts << new_contact
    new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      if contact.id == id
      # if user_id == @@contacts[id]
      return contact
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute_to_update, field_to_update)
    if attribute_to_update == 1
      @first_name = field_to_update
    elsif attribute_to_update == 2
      @last_name = field_to_update
    elsif attribute_to_update == 3
      @email = field_to_update
    elsif attribute_to_update == 4
      @notes = field_to_update
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  # def self.find_by(search_by, searched_for)
  #   @@contacts.each do |contact|
  #     case search_by
  #     when 1 then contact.first_name == searched_for
  #       return contact
  #     when 2 then contact.last_name == searched_for
  #       return contact
  #     when 3 then contact.email == searched_for
  #       return contact
  #     when 4 then contact.notes == searched_for
  #       return contact
  #     end
  #   end
  # end
  def self.find_by(search_by, searched_for)
    @@contacts.each.select do |contact|
      if search_by == 1 && contact.first_name == searched_for
        puts contact.inspect
      elsif search_by == 2 && contact.last_name == searched_for
        puts contact.inspect
      elsif search_by == 3 && contact.email == searched_for
        puts contact.inspect
      elsif search_by == 4 && contact.note == searched_for
        puts contact.inspect
      end
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end

  def full_name
    "#{ first_name } #{ last_name }"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  # self we'll look inside the instance and delete the whole object.
  # self has a way to act dependending on the contact we call it (i.e. if we call it on the class its context we'll be the class, not the instance.)
  def delete
    @@contacts.delete(self)
  end

  # READERS - GETTER
  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def email
    @email
  end

  def note
    @note
  end

  def id
    @id
  end

  # WRITERS - SETTER
  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def email=(email)
    @email = email
  end

  def note=(notes)
    @note = notes
  end
  # Feel free to add other methods here, if you need them.

end

# contact = Contact.create('Betty', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')
# contact2 = Contact.create('Mark', 'Frost', 'markfrost@gmail.com', 'Writer')
# puts Contact.all.inspect
# contact.email  = 'bettymakes@google.com'
# contact.note = 'Loves HTML & CSS'
# puts "-"*40
# # puts contact.inspect
# puts Contact.find(101).inspect
# puts "-"*40
# puts Contact.find_by('Betty').inspect
# puts "-"*50
# # puts Contact.delete_all
# puts contact.update('First Name')
# puts Contact.all.inspect
