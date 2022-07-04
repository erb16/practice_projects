require 'diary'
require 'contacts'
require 'entry'
require 'todo'
require 'todolist'

RSpec.describe "integration" do 
  
  it "constructs a diary" do
    diary = Diary.new
    entry_1 = Entry.new("this is a new diary entry")
    diary.add(entry_1) => [entry_1]
  end

  it "returns all diary entries" do
    diary = Diary.new
    entry_1 = Entry.new("this is a new diary entry")
    entry_2 = Entry.new("this is another diary entry")
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.read).to eq [entry_1, entry_2]
  end

  it "returns contacts list" do
    diary = Diary.new
    entry_1 = Entry.new("my friend Bob: 07770000000")
    entry = entry_1.diary_entry
    contacts = Contacts.new
    contacts_list = contacts.extract_contacts(entry)
    expect(diary.contacts(contacts_list)).to eq ["07770000000"]
  end

  it "returns todo list" do
    diary = Diary.new
    todo_1 = Todo.new("wash the dog")
    todolist_1 = TodoList.new
    todolist_1.add(todo_1.todo)
    result = diary.todolist(todolist_1.list)
    expect(result).to eq ["wash the dog"]
  end

  it "returns a suitable sized chunk of diary to read" do
    diary = Diary.new
    entry_1 = Entry.new("this is a 6 word entry")
    entry_2 = Entry.new("this is 5 word entry")
    entry_3 = Entry.new("3 word entry")
    entry_4 = Entry.new("2 word")
    diary.add(entry_1.diary_entry)
    diary.add(entry_2.diary_entry)
    diary.add(entry_3.diary_entry)
    diary.add(entry_4.diary_entry)
    size = Entry.new("hi")
    size = size.get_chunk_size(2, 2)
    result = diary.read_chunk(size)
    expect(result).to eq ["3 word entry"]
  end

  
end
