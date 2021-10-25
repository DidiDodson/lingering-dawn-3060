require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many :mechanic_rides }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

  describe 'methods' do
    it 'shows open rides in descending order by thrill' do
      park_1 = AmusementPark.create!(name: 'Six Flags', cost_of_admission: 50)

      ride_1 = park_1.rides.create!(name: 'The Hurler', thrill_rating: 7, open: false)
      ride_2 = park_1.rides.create!(name: 'Teacups', thrill_rating: 3, open: true)
      ride_3 = park_1.rides.create!(name: 'Hurricane', thrill_rating: 12, open: true)

      expect(Ride.open_ride.first).to eq(ride_3)
      expect(Ride.open_ride).to include(ride_2)
      expect(Ride.open_ride).to_not include(ride_1)
    end
  end

end
