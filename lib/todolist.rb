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
