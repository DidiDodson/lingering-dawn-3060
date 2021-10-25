require 'rails_helper'

RSpec.describe "Mechanic index page" do
  it "should display all mechanics" do
    park_1 = AmusementPark.create!(name: 'Six Flags', cost_of_admission: 50)

    ride_1 = park_1.rides.create!(name: 'The Hurler', thrill_rating: 7, open: false)
    ride_2 = park_1.rides.create!(name: 'Teacups', thrill_rating: 3, open: true)

    mechanic_1 = Mechanic.create!(name: "Mary Tanaka", years_of_experience: 5)
    mechanic_2 = Mechanic.create!(name: "Jim Begay", years_of_experience: 4)

    mechanic_1.rides << ride_1
    mechanic_1.rides << ride_2
    mechanic_2.rides << ride_1

    visit '/mechanics'

    within("#mechanic-#{mechanic_1.id}") do
      expect(page).to have_content(mechanic_1.name)
      expect(page).to have_content(mechanic_1.years_of_experience)
    end

    within("#mechanic-#{mechanic_2.id}") do
      expect(page).to have_content(mechanic_2.name)
      expect(page).to have_content(mechanic_2.years_of_experience)
    end
  end

  it "should display average years of experience" do
    park_1 = AmusementPark.create!(name: 'Six Flags', cost_of_admission: 50)

    ride_1 = park_1.rides.create!(name: 'The Hurler', thrill_rating: 7, open: false)
    ride_2 = park_1.rides.create!(name: 'Teacups', thrill_rating: 3, open: true)

    mechanic_1 = Mechanic.create!(name: "Mary Tanaka", years_of_experience: 5)
    mechanic_2 = Mechanic.create!(name: "Jim Begay", years_of_experience: 4)

    mechanic_1.rides << ride_1
    mechanic_1.rides << ride_2
    mechanic_2.rides << ride_1

    visit '/mechanics'
    expect(page).to have_content("Average Years of Experience:")
    expect(page).to have_content(4.5)
  end
end
