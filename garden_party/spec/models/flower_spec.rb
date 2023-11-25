require 'rails_helper'

begin
  flower = Flower
rescue
  flower = 'Flower'
end

RSpec.describe flower, type: :model do
  before { skip('Flower model not implemented') unless described_class }

  it 'is expected to validate that :flower_type cannot be empty/falsy' do
    should validate_presence_of(:flower_type)
  end
  it 'is expected to belong to gardener class_name => User required: true' do
    should belong_to(:gardener).class_name(:User)
  end
  it 'is expected to belong to garden class_name => Garden required: true' do
    should belong_to(:garden).class_name(:Garden)
  end

  describe "Foreign key constraints and indexes" do
    it "has a foreign key constraint and index on `gardener_id`" do
      schema = File.read('db/schema.rb')

      expect(/add_foreign_key \"flowers\", \"users\", column: \"gardener_id\"/ =~ schema).not_to be(nil)
      expect(ActiveRecord::Base.connection.index_exists?(:flowers, :gardener_id)).to be(true)
    end

    it "has a foreign key constraint and index on `garden_id`" do
      schema = File.read('db/schema.rb')

      expect(/add_foreign_key \"flowers\", \"gardens\"/ =~ schema).not_to be(nil)
      expect(ActiveRecord::Base.connection.index_exists?(:flowers, :garden_id)).to be(true)
    end
  end
end
