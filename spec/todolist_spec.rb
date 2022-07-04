require 'todolist'

RSpec.describe TodoList do 
  it "constructs" do
    todolist = TodoList.new
  end

  context "given a todo" do
    it "adds the todo to the list" do
      todolist = TodoList.new
      todolist.add("walk the dog")
      expect(todolist.list).to eq ["walk the dog"]
    end
  end

  context "given multiple todos" do
    it "adds multiple todos to the list" do
      todolist = TodoList.new
      todolist.add("walk the dog")
      todolist.add("walk the cat")
      expect(todolist.list).to eq ["walk the dog", "walk the cat"]
    end
  end
end