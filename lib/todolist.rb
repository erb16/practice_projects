class TodoList
  def initialize
    @todolist = []
  end

  def add(todo)
    @todolist = @todolist << todo
  end

  def list
    return @todolist
  end
  
end

#some changes have been made to practice creating a new branch in this repository