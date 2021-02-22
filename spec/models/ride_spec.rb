require 'rails_helper'

describe Ride, type: :model do
  describe "relationships" do
    it { should have_many :ride_mechanics}
    it { should have_many(:mechanics).through(:ride_mechanics)}
  end
end
