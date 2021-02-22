require 'rails_helper'

describe Ride, type: :model do
  before :each do
    @great_adventure = AmusementPark.create!(name: "Six Flags: Great Adventure", price: 50)
    @kingda_ka = @great_adventure.rides.create(name: "Kingda Ka", thrill_rating: 10, open: false)
    @nitro = @great_adventure.rides.create!(name: "Nitro", thrill_rating: 8, open: true)
    @toro = @great_adventure.rides.create!(name: "El Toro", thrill_rating: 6, open: true)
    @batman = @great_adventure.rides.create!(name: "Batman The Ride", thrill_rating: 7, open: true)
  end

  describe "relationships" do
    it { should have_many :ride_mechanics}
    it { should belong_to :amusement_park}
    it { should have_many(:mechanics).through(:ride_mechanics)}
  end

  describe "scope" do
    describe "open_rides" do
      it "should only return rides that are open" do
        expect(Ride.open_rides.pluck(:name)).to eq([@nitro.name, @toro.name, @batman.name])
      end
    end

    describe "average_thrill" do
      it "should give the average rating of thrills" do
        expect(Ride.average_thrill).to eq(7.75)
      end
    end
  end
end
