# Manage robot factory settings.

# When robots come off the factory floor, they have no name.

# The first time you boot them up, a random name is generated in the format of
# two uppercase letters followed by three digits, such as RX837 or BC811.

# Every once in a while we need to reset a robot to its factory settings, which
# means that their name gets wiped. The next time you ask, it will respond with
# a new random name.

# The names must be random: they should not follow a predictable sequence.
# Random names means a risk of collisions. Your solution should not allow the
# use of the same name twice when avoidable. In some exercism language tracks
# there are tests to ensure that the same name is never used twice.```

require_relative '../robot'

describe Robot do
  before(:context) do
    @robot1 = Robot.new
  end

  describe 'Initialization' do
    # 1 = update this test, so you'll get random name
    it 'is an instance of the Robot class' do
      expect(@robot1).to be_instance_of(Robot)
    end
  end

# 2

  describe 'Name' do
    it 'should exist' do
      expect(@robot1.name).to be_truthy
    end
    it 'should be be a string' do
      expect(@robot1.name).to be_instance_of String
    end
    it 'should have five characters' do
      expect(@robot1.name.length).to eq(5)
    end
    it 'should not be able to change itself' do
      @robot1.name = 'ABC12' if respond_to? :name=
      expect(@robot1.name).not_to eq('ABC12')
    end
    it 'first three characters should be strings' do
      arr = @robot1.name.split('')
      expect(arr[0]).to be_instance_of String
      expect(arr[1]).to be_instance_of String
      expect(arr[2]).to be_instance_of String
    end
    it 'first three characters should be uppercase' do
      arr = @robot1.name.split('')
      expect(arr[0]).to be(/^[A-Z]$/)
      expect(arr[1]).to be(/^[A-Z]$/)
      expect(arr[2]).to be(/^[A-Z]$/)
    end
    it 'last two characters should be numbers' do
      arr = @robot1.name.split('')
      expect(arr[3].to_i).to be_instance_of Integer
      expect(arr[4].to_i).to be_instance_of Integer
    end
  end

  describe 'Robot Army' do
    it 'should all have different names' do
      robot_names = []
      1000.times do
        new_robot = Robot.new
        robot_names.push(new_robot.name)
      end
      expect(robot_names.uniq.count).to eq(1000)
    end
  end

  describe 'Method' do
    it 'can reset its name' do
      old_name = @robot1.name
      @robot1.reset
      expect(@robot1.name).not_to eq(old_name)
    end
  end
end
