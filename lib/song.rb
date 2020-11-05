class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(song)
    thing = self.new
    thing.name = song
    thing
  end

  def self.create_by_name(song)
    if !self.find_by_name(song)
      thing = self.new_by_name(song)
      self.all << thing
      thing
    else
      nil
    end

  end

  def self.find_by_name(string)
    self.all.each do |i|
      if i.name == string
        return i
      end
    end
    nil
  end


  def self.find_or_create_by_name(name)
    self.find_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|object| object.name}
  end

  def self.new_from_filename(string)
    array = string.split(/\s-\s/)
    thing = self.new_by_name(array[1].delete_suffix(".mp3"))
    thing.artist_name = array[0]
    thing
  end

  def self.create_from_filename(string)
    thing = self.new_from_filename(string)
    self.all << thing
  end

  def self.destroy_all
    self.all.clear
  end

end
