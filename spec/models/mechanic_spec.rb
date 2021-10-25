require "rails_helper"

RSpec.describe Mechanic, type: :model do
  describe "relationships" do
    it { should have_many :mechanic_rides}
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe 'methods' do
    it 'shows average years of experience' do
      mechanic_1 = Mechanic.create!(name: "Mary Tanaka", years_of_experience: 5)
      mechanic_2 = Mechanic.create!(name: "Jim Begay", years_of_experience: 4)

      expect(Mechanic.average_years).to eq(4.5)
    end
  end
end
