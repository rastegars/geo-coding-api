require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  def setup
    @place = places(:one)
  end

  test 'valid place' do
    assert @place.valid?
  end

  test 'invalid without address' do
    @place.location = nil
    refute @place.valid?
    assert_not_nil @place.errors[:location]
  end

  test 'invalid without latitude' do
    @place.lat = nil
    refute @place.valid?
    assert_not_nil @place.errors[:latitude]
  end

  test 'invalid without longitude' do
    @place.lon = nil
    refute @place.valid?
    assert_not_nil @place.errors[:longitude]
  end
end
