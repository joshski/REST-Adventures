class Dungeon
  attr_accessor :entrance, :treasure_chamber
end

class Room
  
  attr_accessor :east, :south, :west
  
end

Given /^there is an entrance$/ do
  @dungeon = Dungeon.new
  @dungeon.entrance = Room.new
  @previous_room = @dungeon.entrance
end

Given /^a room to the east of the entrance$/ do
  current_room = Room.new
  @previous_room.east = current_room
  @previous_room = current_room
end

Given /^a second room to the south of the first room$/ do
  current_room = Room.new
  @previous_room.south = current_room
  @previous_room = current_room
end

Given /^a treasure chamber to the west of the second room$/ do
  @dungeon.treasure_chamber = Room.new
  @previous_room.west = @dungeon.treasure_chamber
end

When /^I enter the dungeon$/ do
  @current_room = @dungeon.entrance
end

When /^I go east$/ do
  @current_room = @current_room.east
end

When /^I go south$/ do
  @current_room = @current_room.south
end

When /^I go west$/ do
  @current_room = @current_room.west
end

Then /^I should be in the treasure chamber$/ do
  @current_room.should == @dungeon.treasure_chamber 
end

