class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

    def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
    end

    def self.find_by_name(name)
      self.all.find { |song| song.name == name}
    end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |e| e.name}
  end

  def self.new_from_filename(filename)
    name_array = filename.split(' - ')
    name_array[-1] = name_array[-1].split('.mp3')
    name_array.flatten!
    song = Song.new
    song.name = name_array[-1]
    song.artist_name = name_array[0]
    song
  end

  def self.create_from_filename(filename)
    name_array = filename.split(' - ')
    name_array[-1] = name_array[-1].split('.mp3')
    name_array.flatten!
    song = Song.new
    song.name = name_array[-1]
    song.artist_name = name_array[0]
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end

end
