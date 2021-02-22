require 'rails_helper'

RSpec.describe "mechanic's index page", type: :feature do
  before :each do
    @jane = Mechanic.create(name: "Jane Goodwin", years_experience: 10)
    @jack = Mechanic.create(name: "Jack Yarn", years_experience: 8)
    @mike = Mechanic.create(name: "Mike Bigalo", years_experience: 5)
    @meg = Mechanic.create(name: "Meg Shell", years_experience: 15)
    @bob = Mechanic.create(name: "Bob Bobberan", years_experience: 30)
    @betty = Mechanic.create(name: "Betty Sweaty", years_experience: 1)

    @average_years_experience = 11.5
  end

  describe "can display all mechanics" do
    it "can see all mecahnicas names and experience" do
      visit "/mechanics"
      expect(page).to have_content("All Mechanics")

      within ".mechanics_info#basic" do
        expect(page).to have_content (@jane.name)
        expect(page).to have_content (@jack.name)
        expect(page).to have_content (@mike.name)
        expect(page).to have_content (@meg.name)
        expect(page).to have_content (@bob.name)
        expect(page).to have_content (@betty.name)
        expect(page).to have_content (@jane.experience)
        expect(page).to have_content (@jack.experience)
        expect(page).to have_content (@mike.experience)
        expect(page).to have_content (@meg.experience)
        expect(page).to have_content (@bob.experience)
        expect(page).to have_content (@betty.experience)
      end
    end

    it "can see the average_years_experience for all mechanics" do
      visit "/mechanics"
      within ".mechanics_info#stats" do
        expect(page).to have_content(@average_years_experience)
      end
    end
  end
end
