require 'rails_helper'

describe Mechanic, type: :model do
  before :each do
    @great_adventure = AmusementPark.create!(name: "Six Flags: Great Adventure", price: 50)
    @kingda_ka = @great_adventure.rides.create(name: "Kingda Ka", thrill_rating: 10, open: false)
    @nitro = @great_adventure.rides.create!(name: "Nitro", thrill_rating: 8, open: true)

    @jane = Mechanic.create!(name: "Jane Goodwin", years_experience: 10)
    @jack = Mechanic.create!(name: "Jack Yarn", years_experience: 8)
    @mike = Mechanic.create!(name: "Mike Bigalo", years_experience: 5)
    @meg = Mechanic.create!(name: "Meg Shell", years_experience: 15)
    @bob = Mechanic.create!(name: "Bob Bobberan", years_experience: 30)
    @betty = Mechanic.create!(name: "Betty Sweaty", years_experience: 1)

    @average_years_experience = 11.5
  end

  describe "relationships" do
    it { should have_many :ride_mechanics}
    it { should have_many(:rides).through(:ride_mechanics)}
  end

  describe "scopes" do
    it "should return the average_years_experience" do
      expect(Mechanic.average_years_experience).to eq(@average_years_experience)
    end
  end
end
