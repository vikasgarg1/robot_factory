require_relative '../lib/robot.rb'

describe Robot do
  before(:context) do
    @robot1 = Robot.new
  end

  describe 'Initialization' do
    it 'is an instance of the Robot class' do
      expect(@robot1).to be_instance_of(Robot)
    end
  end

  describe 'Name' do
    it 'should exist' do
      expect(@robot1.name).to exist
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
end
