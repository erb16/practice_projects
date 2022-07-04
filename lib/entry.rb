class Entry
  
  def initialize(new_entry)
    @new_entry = new_entry
  end

  def diary_entry
    return @new_entry
  end

  def count
    return @new_entry.split(" ").length
  end

  def get_chunk_size(wpm, minutes)
    chunk_size = wpm * minutes
  end
end

