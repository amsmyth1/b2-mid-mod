require 'rails_helper'

RSpec.describe "mechanic's show page", type: :feature do
  before :each do
    @jane = Mechanic.create(name: "Jane Goodwin", years_experience: 10)
    @kingda_ka = Ride.create(name: "Kingda Ka", thrill_rating: 10, open: false)
    @nitro = Ride.create(name: "Nitro", thrill_rating: 8, open: true)
    @toro = Ride.create(name: "El Toro", thrill_rating: 6, open: true)
    @batman = Ride.create(name: "Batman The Ride", thrill_rating: 7, open: true)
    @teacups = Ride.create(name: "Tea Time", thrill_rating: 3, open: true)

    @jane.rides << @kingda_ka
    @jane.rides << @nitro
    @jane.rides << @toro
    @jane.rides << @batman
  end

  describe "can display all mechanic information" do
    it "shows their name, years of experience, and the names of all rides they’re working on" do
      visit "/mechanics/#{@jane.id}"

      expect(page).to have_content(@jane.name)
      expect(page).to have_content(@jane.years_experience)
      expect(page).to have_content(@nitro.name)
      expect(page).to have_content(@toro.name)
      expect(page).to have_content(@batman.name)
    end

    it "shows only rides that are open" do
      visit "/mechanics/#{@jane.id}"

      expect(page).to_not have_content(@kingda_ka.name)
    end

    it "lists all rides by most thrilling first" do
      visit "/mechanics/#{@jane.id}"

      within ".mechanic_rides#current_workload" do
        expect(@nitro.name).to appear_before(@batman.name)
        expect(@nitro.name).to appear_before(@toro.name)
        expect(@batman.name).to appear_before(@toro.name)
      end
    end
  end

  describe "can add a ride to a mechanic" do
    it "can display a form to add a ride" do
      visit "/mechanics/#{@jane.id}"

      within ".mechanic_rides#add_ride" do
        expect(page).to have_content("Add a ride to workload")
        page.find_button("Submit")
      end
    end

    it "can fill in the form to add a ride" do
      visit "/mechanics/#{@jane.id}"

      fill_in :ride_id, with: "#{@teacups.id}"
      click_button("Submit")

      within ".mechanic_rides#current_workload" do
        expect(@nitro.name).to appear_before(@batman.name)
        expect(@nitro.name).to appear_before(@toro.name)
        expect(@batman.name).to appear_before(@toro.name)
        expect(@batman.name).to appear_before(@teacups.name)
        expect(@toro.name).to appear_before(@teacups.name)
      end
    end
  end
end
