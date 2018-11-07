require_relative "room"
require "byebug"

class Hotel
  def initialize(name, rooms)
    @name = name
    @rooms = {}
    rooms.each do |room_name, capacity|
      @rooms[room_name] = Room.new(capacity)
    end
  end

  def name
    @name.split.map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    @rooms.has_key?(room_name)
  end

  def check_in (person_name, room_name)
    # debugger
    if !self.room_exists?(room_name)
      puts "sorry, room does not exist"
    else
      if @rooms[room_name].add_occupant(person_name)
        puts "check in successful"
      else
        puts "sorry, room is full"
      end
    end
  end

  def has_vacancy?
    @rooms.values.any?{ |room| room.full? == false}
  end

  def list_rooms
    @rooms.each do |room_name, room|
        print "#{room_name} #{room.available_space.to_s}\n"
    end
  end
end
