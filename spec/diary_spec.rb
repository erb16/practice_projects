require 'diary'

RSpec.describe Diary do
  it "constructs" do
    diary = Diary.new
  end

    it "adds an entry" do
      diary = Diary.new
      expect(diary.add('this is a diary entry')).to eq ['this is a diary entry']
    end

    context "when given a new diary entry" do
      it "adds the entry to the full diary" do
        diary = Diary.new
        diary.add("this is a new diary entry")
        expect(diary.read).to eq ["this is a new diary entry"]
      end
    end
  
    context "when given multiple diary entries" do
      it "adds all entries to the diary" do
        diary = Diary.new
        diary.add("this is a new diary entry")
        diary.add("this is another new diary entry")
        expect(diary.read).to eq ["this is a new diary entry", "this is another new diary entry"]
      end
    end

    context "when given a contacts list" do
      it "returns list of contacts" do
        diary = Diary.new
        result = diary.contacts("0777000000")
        expect(result).to eq "0777000000"
      end
    end

    context "when given a todo list" do
      it "returns a list of todos" do
        diary = Diary.new
        result = diary.todolist("wash the dog")
        expect(result).to eq "wash the dog"
      end
    end

    context "when given a chunk size 3" do
      it "returns an entry of that exact size" do
        diary = Diary.new
        diary.add("one two three")
        result = diary.read_chunk(3)
        expect(result).to eq ["one two three"]
      end
    end

    context "when given a chunk size 4 but no entry of that length" do
      it "returns a smaller entry size" do
        diary = Diary.new
        diary.add("one two three")
        result = diary.read_chunk(4)
        expect(result).to eq ["one two three"]
      end
    end

    context "when given many entries and a chunk size of 4" do
      it "returns closest next entry in size" do
        diary = Diary.new
        diary.add("one")
        diary.add("one " * 2)
        diary.add("one " * 3)
        diary.add("one " * 5)
        result = diary.read_chunk(4)
        expect(result).to eq ["one one one "]
      end
    end
end