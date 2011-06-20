class Server
  def self.get(room)
    
  end
end

class MockServer
  @responses = []
  
  class Response
    attr_accessor :type
    def initialize(args = {})
      @type = args[:type] if args[:type]
    end
  end

  def self.responses(responses = nil)
    @responses = responses if responses
    @responses || []
  end

  def self.get(room_id)
    r = @responses.find {|r| r.id == room_id}
    if r
      Response.new(r)
    else
      nil
    end
  end
  
end

Server = MockServer

class Room

  attr_accessor :room_type

  def self.get(identifier)
    room = self.new
    room.room_type = Server.get(identifier).type.to_sym
    room
  end
  
end


describe "The Dungeon" do

  before do
    room = {
      :id => 5,
      :exits => {
        :e => 1,
        :s => 2,
        :w => 3
      },
      :type => :room
    }
    MockServer.responses([room])
  end
  
  it "should handle not existent rooms"
  

  it "has an entrance" do
    room = Room.get('entrance')
    room.should be_instance_of Room
    room.room_type.should == :entrance
  end
  
  it "has room" do
    room = Room.get('5')
    room.should be_instance_of Room
    room.room_type.should == :room
  end

  describe "a room" do

   it "has a type" do
     r = Room.get(5)
     r.should respond_to :room_type
     r.room_type.should == :room
   end

   it "has a list of exits" do

     r = Room.get(5)

     r.should respond_to :exits
     exits = r.exits
     exits[:e].should be 1
     exits[:s].should be 2
     exits[:w].should be 3
     exits[:n].should be nil
   end
  
  it "has a treasure chamber" do
  end
  
 end
 
end

