require 'rails_helper'

RSpec.describe "Mechanic show page" do
  it "should display mechanic name and years of experience" do
    park_1 = AmusementPark.create!(name: 'Six Flags', cost_of_admission: 50)

    ride_1 = park_1.rides.create!(name: 'The Hurler', thrill_rating: 7, open: false)
    ride_2 = park_1.rides.create!(name: 'Teacups', thrill_rating: 3, open: true)

    mechanic_1 = Mechanic.create!(name: "Mary Tanaka", years_of_experience: 5)

    mechanic_1.rides << ride_1
    mechanic_1.rides << ride_2

    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_of_experience)
  end
end
