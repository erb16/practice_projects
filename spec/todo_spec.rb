require 'todo'

RSpec.describe Todo do
  it "constructs" do
    todo = Todo.new("wash the dog")
    expect(todo.todo).to eq "wash the dog"
  end

  context "when given a todo" do
    it "returns a list of todos" do
      todo = Todo.new("wash the dog")
      expect(todo.todo).to eq "wash the dog"
    end
  end

end