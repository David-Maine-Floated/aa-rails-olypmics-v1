require 'rails_helper'

begin
  garden = Garden
rescue
  garden = 'Garden'
end

RSpec.describe garden, type: :model do
  before { skip('Garden model not implemented') unless described_class }

  let (:user1) { User.create(username: "AppleSauce") }
  subject { Garden.create(name: "The Oasis", size: 1000, garden_owner_id: user1.id) }

  it 'is expected to validate that :name cannot be empty/falsy' do 
    should validate_presence_of(:name)
  end
  it 'is expected to validate that :name is case-sensitively unique within the scope of :garden_owner_id' do 
    should validate_uniqueness_of(:name).scoped_to(:garden_owner_id)
  end
  it 'is expected to validate that :size cannot be empty/falsy' do 
    should validate_presence_of(:size)
  end
  it 'is expected to belong to garden_owner class_name => User required: true' do 
    should belong_to(:garden_owner).class_name(:User)
  end
  it 'is expected to have many flowers class_name => Flower' do 
    should have_many(:flowers).class_name(:Flower)
  end

  it "has a foreign key constraint and (exactly one) index for `garden_owner_id`" do
    schema = File.read('db/schema.rb')

    expect(/add_foreign_key \"gardens\", \"users\", column: \"garden_owner_id\"/ =~ schema).not_to be(nil)
    expect(ActiveRecord::Base.connection.index_exists?(:gardens, [:garden_owner_id, :name])).to be(true)
    expect(ActiveRecord::Base.connection.index_exists?(:gardens, :garden_owner_id)).to be(false)
  end

  it "can be successfully destroyed" do
    user2 = User.create!(username: "Bill")
    Flower.create!(flower_type: "Rose", gardener_id: user2.id, garden_id: subject.id)
    expect { subject.destroy }.not_to raise_error
  end
end
