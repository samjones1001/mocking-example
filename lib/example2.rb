class ObjectUnderTest
  def initialize
    @other_object = OtherObject.new
  end

  def delegated_method
    @other_object.dangerous_operation
  end
end

class OtherObject
  def dangerous_operation
    "DANGER!!!!"
  end
end

describe ObjectUnderTest do
  subject(:object_under_test) { ObjectUnderTest.new }

  describe '#delegated_method' do
    it 'returns some value' do
      expect(object_under_test.delegated_method).to eq("DANGER!!!!")
    end
  end
end
