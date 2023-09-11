class Guest
  attr_reader :name, :friends, :time
  def initialize(name, friends, time)
    @name = name
    @friends = friends
    @time = time
  end
end