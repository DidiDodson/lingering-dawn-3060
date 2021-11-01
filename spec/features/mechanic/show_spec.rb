require 'rails_helper'

RSpec.describe "Mechanic show page" do
  it "should display mechanic name and years of experience" do
    park_1 = AmusementPark.create!(name: 'Six Flags', cost_of_admission: 50)

    ride_1 = park_1.rides.create!(name: 'The Hurler', thrill_rating: 7, open: false)
    ride_2 = park_1.rides.create!(name: 'Teacups', thrill_rating: 3, open: true)
    ride_3 = park_1.rides.create!(name: 'Hurricane', thrill_rating: 12, open: true)

    mechanic_1 = Mechanic.create!(name: "Mary Tanaka", years_of_experience: 5)

    mechanic_1.rides << ride_1
    mechanic_1.rides << ride_2
    mechanic_1.rides << ride_3

    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_of_experience)
    expect(page).to have_content(mechanic_1.rides.name)
  end

  it "shows open rides in descending order by thrill rating" do
    park_1 = AmusementPark.create!(name: 'Six Flags', cost_of_admission: 50)

    ride_1 = park_1.rides.create!(name: 'The Hurler', thrill_rating: 7, open: false)
    ride_2 = park_1.rides.create!(name: 'Teacups', thrill_rating: 3, open: true)
    ride_3 = park_1.rides.create!(name: 'Hurricane', thrill_rating: 12, open: true)

    mechanic_1 = Mechanic.create!(name: "Mary Tanaka", years_of_experience: 5)

    mechanic_1.rides << ride_1
    mechanic_1.rides << ride_2
    mechanic_1.rides << ride_3

    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_3.name)
    expect(page).to_not have_content(ride_1.name)

    expect(mechanic_1.rides.open_ride.first.name).to eq(ride_3.name)
  end

  it "adds new ride to workload and displays ride name" do
    park_1 = AmusementPark.create!(name: 'Six Flags', cost_of_admission: 50)

    ride_1 = park_1.rides.create!(name: 'The Hurler', thrill_rating: 7, open: false)
    ride_2 = park_1.rides.create!(name: 'Mamba', thrill_rating: 12, open: true)

    mechanic_1 = Mechanic.create!(name: "Mary Tanaka", years_of_experience: 5)

    MechanicRide.create!(mechanic: mechanic_1, ride: ride_1)

    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content("Add a Ride to Workload:")
    expect(page).to have_button("Submit")

    expect(page).to_not have_content(ride_2.name)

    fill_in "ride_id", with: "#{ride_2.id}"
    click_button "Submit"

    expect(page).to have_content(ride_2.name)
    expect(current_path).to eq("/mechanics/#{mechanic_1.id}")
  end
end
