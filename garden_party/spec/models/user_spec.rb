require 'rails_helper'

begin
  user = User
rescue
  user = 'User'
end

RSpec.describe user, type: :model do
  before { skip('User model not implemented') unless described_class }
  subject { User.create(username: "AppleSauce") }

  it 'is expected to validate that :username cannot be empty/falsy' do 
    should validate_presence_of(:username)
  end
  it 'is expected to validate that :username is case-sensitively unique' do 
    should validate_uniqueness_of(:username)
  end
  it 'is expected to have many gardens class_name => Garden' do 
    should have_many(:gardens).class_name(:Garden)
  end
  it 'is expected to have many flowers class_name => Flower' do 
    should have_many(:flowers).class_name(:Flower)
  end
  it 'is expected to have many flowers_in_all_gardens through gardens source => flowers' do 
    should have_many(:flowers_in_all_gardens).through(:gardens).source(:flowers)
  end
  it 'is expected to have many gardens_with_my_flowers through flowers source => garden' do 
    should have_many(:gardens_with_my_flowers).through(:flowers).source(:garden)
  end

  it "has an index on `username`" do
    expect(ActiveRecord::Base.connection.index_exists?(:users, :username)).to be(true)
  end

  it "makes sure associations are bi-directional" do
    Garden.create!(name: "Garden", size: 100, garden_owner_id: subject.id)
    Flower.create!(flower_type: "Rose", gardener_id: subject.id, garden_id: Garden.first.id)
    flower = subject.flowers.first
    garden = subject.gardens.first
    expect(subject.object_id == flower.gardener.object_id).to be(true)
    expect(subject.object_id == garden.garden_owner.object_id).to be(true)
  end

  it "can be successfully destroyed" do
    Garden.create!(name: "Garden", size: 100, garden_owner_id: subject.id)
    Flower.create!(flower_type: "Rose", gardener_id: subject.id, garden_id: Garden.first.id)
    expect { subject.destroy }.not_to raise_error
  end
end
