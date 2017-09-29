require './contact.rb'

class CRM

  def initialize
    main_menu
  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end
  end

  def add_new_contact
    puts "First name:"
    first_name = gets.chomp
    puts "Last name"
    last_name = gets.chomp
    puts "e-mail address:"
    email = gets.chomp
    puts "Notes:"
    note = gets.chomp
    # Contact.create(first_name, last_name, email, note)
    contact = Contact.create(
      first_name: first_name,
      last_name:  last_name,
      email:      email,
      note:       note
    )
  end

  def modify_existing_contact
    puts "What contact would you like to modify?"
    id_to_modify = gets.chomp.to_i
    # name_to_modify = gets.chomp
    # contact = Contact.find_by(name_to_modify)
    contact = Contact.find(id_to_modify)
    puts "What attribute would you like to update?"
    puts "1) Name 2) Last Name 3) e-mail 4) notes"
    puts 'Enter a number: '
    attribute_to_update = gets.chomp.to_i
    if attribute_to_update == 4
      attribute_to_update = 'note'
    elsif attribute_to_update == 3
      attribute_to_update = 'email'
    elsif attribute_to_update == 2
      attribute_to_update = 'last_name'
    elsif attribute_to_update == 1
      attribute_to_update = 'first_name'
    end
    puts "What is the new value?"
    new_value = gets.chomp
    contact.update(attribute_to_update.to_sym => new_value)
  end

  def delete_contact
    puts "What contact would you like to delete?"
    id_to_delete = gets.chomp.to_i
    contact = Contact.find(id_to_delete)
    contact = contact.delete
  end

  def display_all_contacts
    Contact.all.each do |contact|
      puts contact.inspect
    end
  end

  def search_by_attribute
    puts "What attribute would you like to search for?"
    puts "1) Name 2) Last Name 3) e-mail 4) notes"
    puts 'Enter a number: '
    search_by = gets.chomp.to_i
    puts "Enter the value to search for:"
    search_for = gets.chomp
    if search_by == 4
      search_by = 'note'
    elsif search_by == 3
      search_by = 'email'
    elsif search_by == 2
      search_by = 'last_name'
    elsif search_by == 1
      search_by = 'first_name'
    end
    puts Contact.find_by(search_by.to_sym => search_for).inspect
  end

end
# contact1 = Contact.create('Betty', 'Makes', 'bettymakes@gmail.com', 'Cook')
# contact2 = Contact.create('Mark', 'Frost', 'markfrost@gmail.com', 'Writer')
session1 = CRM.new
session1.main_menu

at_exit do
  ActiveRecord::Base.connection.close
end
