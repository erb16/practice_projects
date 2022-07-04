class Diary
  
  def initialize
    @entire_diary = []
  end

  def add(entry)
    @entire_diary = @entire_diary << entry
  end

  def read
    return @entire_diary
  end

  def read_chunk(size)
    @entire_diary = @entire_diary.sort { |a, b| a.split(" ").length <=> b.split(" ").length }
    chunk = @entire_diary.select { |entry| entry.split(' ').length == size}
    if chunk.empty?
      until !chunk.empty? do
        size = size - 1
        chunk = @entire_diary.select { |entry| entry.split(' ').length == size}
      end 
        return chunk
    else
      return chunk
    end
        


  end

  def contacts(contacts_list)
    @contacts = contacts_list
    return @contacts
  end

  def todolist(list)
    @todolist = list
    return @todolist
  end

end