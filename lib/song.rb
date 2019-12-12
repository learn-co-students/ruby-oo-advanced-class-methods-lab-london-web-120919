require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = nil)
    @name = name
    save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name = nil)
    self.new(name)
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    self.create(name)
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    songs = self.all.sort_by { |song| song.name }
  end

  def self.filename_parse(filename)
    song_array = filename.split(" - ")
    @artist_name = song_array[0]
    @name = song_array[1].gsub(".mp3","")
  end

  def self.new_from_filename(filename)
    self.filename_parse(filename)

    song = self.new_by_name(@name)
    song.artist_name = @artist_name
    song
  end

  def self.create_from_filename(filename)
    self.filename_parse(filename)

    song = self.create_by_name(@name)
    song.artist_name = @artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
