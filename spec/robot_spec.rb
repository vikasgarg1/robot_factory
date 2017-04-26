require_relative '../robot'

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
    it 'first three characters should be strings' do
      arr = @robot1.name.split('')
      expect(arr[0]).to be_instance_of String
      expect(arr[1]).to be_instance_of String
      expect(arr[2]).to be_instance_of String
    end
    it 'first three characters should be uppercase' do
      arr = @robot1.name.split('')
      expect(arr[0]).to be(/[A-Z]/)
      expect(arr[1]).to be(/[A-Z]/)
      expect(arr[2]).to be(/[A-Z]/)
    end
    it 'last two characters should be numbers' do
      arr = @robot1.name.split('')
      expect(arr[3].to_i).to be_instance_of FixedNum
      expect(arr[4].to_i).to be_instance_of FixedNum
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
