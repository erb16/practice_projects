class Contacts

  def initialize
    @contactslist = []
  end

  def contacts_list
    return @contactslist
  end

  def extract_contacts(new_entry)
    new_entry.to_s.scan(/[0-9]{11}/).each do |number|
      @contactslist = @contactslist << number
    end
  end

end
