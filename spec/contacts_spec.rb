require 'contacts'

RSpec.describe Contacts do
  it "constructs" do
    contacts = Contacts.new
    expect(contacts.contacts_list).to eq []
  end

  context "when given a diary entry" do
    it "extracts contact numbers" do
      contacts = Contacts.new
      result = contacts.extract_contacts("My friend Bob: 07770000000")
      expect(result).to eq ["07770000000"]
    end
  end
end