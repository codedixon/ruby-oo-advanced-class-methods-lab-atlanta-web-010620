require 'Pry'

class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|person| person.name == name}
  end


  def save
    self.class.all << self
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
   self.all.sort_by{|person| person.name}
  end

  def self.new_from_filename(song)
    file_song = self.new
    new_array = song.split(" - ")
    file_song.artist_name = new_array[0]
    file_song.name = new_array[1].split(".")[0] 
    file_song
  end

  def self.create_from_filename(song)
    new_song = self.new_from_filename(song)
    @@all << new_song
    new_song
  end

  def self.destroy_all
    self.all.clear
  end


end
