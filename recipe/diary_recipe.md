{{PROBLEM}} Multi-Class Planned Design Recipe
1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

VERBS:
record, keep, reflect on, read, select, keep track of, see a list
NOUNS: experiences, diary, past diary entries, time, reading speed, tasks, todo list, contacts, mobile phone numbers

2. Design the Class System
Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything. The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com

                             ┌───────────────────────────────────────┐
                             │                                       │  contacts   ┌──────────────────────────────────────────┐
                             │      ENTRY class                      │takes entries│                                          │
                             │      -get a chunk to read, dependent  ├─────────────►   CONTACTS class                         │
┌────────────────────────────┤      on time and reading speed        │             │   -extracts telephone numbers from entries
│                            │      -add new entry                   │             │   -keeps a list of numbers               │
│                            │                                       │             │                                          │
│                            │                                       │             │                                          │
│                            │                                       │             │                                          │
│                            └────────────────┬──────────────────────┘             │                                          │
│                                             │                                    └───┬──────────────────────────────────────┘
│                                             │ Diary takes                            │
│                                             │ various entries                        │
│                                             │                                        │
│                                             │                                        │
│                           ┌─────────────────▼─────────────────────┐                  │
│                           │                                       │                  │
│                           │                                       │   Diary          │
│                           │                                       │   takes list of  │
│                           │     Diary class                       │   contacts       │
│                           │     -access full diary (all entries)  │                  │
│                           │     -read diary                       ◄──────────────────┘
│                           │     -add diary entries to full diary  │
│                           │     -access contact list              │
│                           │     -access todolist                  │
│                           │                                       │
│                           └──────▲────────────────────────────────┘
│                                  │
│                                  │Diary takes list of todos
│                                  │
│    ┌─────────────────────────────┴──────────┐
│    │                                        │                ┌────────────────────────────────────────┐
│    │  TODOLIST class                        │                │                                        │
│    │                                        │todolist takes  │   TODO class                           │
│    │  -stores list of todos                 │ various todos  │                                        │
│    │  -stores list of completed todos?      │                │  - takes a todo                        │
│    │  -stores list of uncompleted todos?    ◄────────────────┤  - marks todos as complete?            │
│    │                                        │                │  -selects todos from entries?          │
│    │                                        │                │                                        │
│    │                                        │                │                                        │
│    │                                        │                │                                        │
│    └────────────────────────────────────────┘                └──────────────┬─────────────────────────┘
│                                                                             │
│                                                                             │
│                                                                             │Todo takes entries?
│                                                                             │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘


Also design the interface of each class in more detail.

class Diary
  def initialize
    # ...
    @entire_diary = []
  end

  def add(entry)
    #entry is an instance of the Entry class
    #saves entry to the entire_diary array
  end

  def read
    #returns full diary
  end

  def read_chunk(word_count)
    #word_count is an instance+method of entry.get_chunk
    #return suitable sized chunk from @entire_diary array
  end

  def contacts(contacts_list)
    #returns contact list
    #contacts_list is an instance of contacts
  end

  def todolist(list)
    #list is an instance of todo
    #returns todo list
  end
end
 

class Entry
  def initialize(new_entry) 
  #new_entry is a string
  end

  def diary_entry
    #returns the new entry
  end

  def get_chunk(wpm, time) 
    #wpm and time are integers
    #returns amount of words that can be read in time available given reading speed
  end

end

class Contacts

  def initialize
    #contains list of contacts
  end

  def contacts_list
    #return list of contacts
  end

  def extract_contacts(new_entry)
    #new_entry is an instance of the entry class.diary_entry
    #adds contact to the contact list
  end


end

class Todo

  def initialize(todo)
    #todo is a string
  end

  def todo
    #returns todo
  end

  def mark_complete!(todo)
    #adds ": done" to the end of the todo string
  end

  def complete?(todo)
    #boolean, returns true if todo is complete, false if todo is not complete
  end
end

class TodoList

  def initialize
    @todolist
  end

  def add(todo)
    #todo is an instance of the todo class
    #todo is added to the todo list
  end

  def list
    #returns list of todos
  end

  def complete
    #returns strings within the list that have been marked complete
  end

  def incomplete
    #returns strings within the list that haven't been marked complete
  end
end






3. Create Examples as Integration Tests
Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.

# EXAMPLE

# Returns diary entries (it constructs)
diary = Diary.new
entry_1 = Entry.new("this is a new diary entry")
diary.add(entry_1) => [entry_1]

# Returns all diary entries
diary = Diary.new
entry_1 = Entry.new("this is a new diary entry")
entry_2 = Entry.new("this is another diary entry")
diary.add(entry_1)
diary.add(entry_2)
diary.read # => [entry_1, entry_2]

# Returns contacts list
diary = Diary.new
entry_1 = Entry.new("my friend Bob: 07770000000")
contacts = Contacts.new
extract_contacts = contacts.extract_contacts(entry_1)
diary.contacts(extract_contacts) # => ["07770000000"]

# Adds todos to the todolist
todo_1 = Todo.new("Walk the dog")
todo_2 = Todo.new("Walk the cat")
todolist = TodoList.new
todolist.add(todo_1)
result = todolist.add(todo_2)
expect(result).to eq [todo_1, todo_2]

# Returns todo list
diary = Diary.new
todo = Todo.new("Wash the dog")
todolist = TodoList.new
todolist_1 = todolist.add(todo)
diary.todolist(todo_list_1) # => ["Wash the dog"]

# Returns suitably sized chunk of text
diary = Diary.new
entry = Entry.new
entry_1 = entry.add("This chunk is 6 words long")
entry_chunk_size = entry.get_chunk(6, 1)
diary.read_chunk(entry_chunk_size) # => entry_1


4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

# EXAMPLE

# Diary -- constructs
diary = diary.new
diary.read # => []

# Entry -- constructs
entry = Entry.new("this is a new entry")
entry.diary_entry # => entry

# Entry -- gets a chunk
entry_1 = Entry.new("this is a new entry")
entry_1.get_chunk(6, 1) # => 6

# Contacts -- constructs
contacts = Contacts.new
contacts.contacts_list # => []

# Todo -- constructs
todo = Todo.new
todo.add("wash the dog") # => "wash the dog"

# TodoList -- constructs
todolist = TodoList.new
todolist # => []

# TodoList -- adds todos to the todolist


Encode each example as a test. You can add to the above list as you go.


5. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.