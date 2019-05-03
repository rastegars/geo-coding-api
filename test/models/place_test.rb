require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  def setup
    @place = places(:one)
  end

  test 'valid place' do
    assert @place.valid?
  end

  test 'invalid without name' do
    @place.name = nil
    refute @place.valid?
    assert_not_nil @place.errors[:name]
  end

  test 'invalid without latitude' do
    @place.latitude = nil
    refute @place.valid?
    assert_not_nil @place.errors[:latitude]
  end

  test 'invalid without longitude' do
    @place.longitude = nil
    refute @place.valid?
    assert_not_nil @place.errors[:longitude]
  end
end
