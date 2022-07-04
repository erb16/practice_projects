require "entry"

RSpec.describe Entry do
  it "constructs" do
    entry = Entry.new("this is a new entry")
    expect(entry.diary_entry).to eq "this is a new entry"
  end

  context "when given a new entry" do
    it "counts words" do
      entry = Entry.new("this is a 6 word entry")
      expect(entry.count).to eq 6
    end
  end
  


  context "when given reading time and amount of time available" do
    it "returns amount of words that can be read" do
      entry = Entry.new("this is a new entry")
      result = entry.get_chunk_size(8, 3)
      expect(result).to eq 24
    end
  end
end