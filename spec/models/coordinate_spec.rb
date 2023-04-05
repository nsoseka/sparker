require 'rails_helper'

RSpec.describe Coordinate, type: :model do
  describe 'associations' do
    it { should belong_to(:address) }
  end

  describe 'db_columns' do
    it { is_expected.to have_db_column(:lng).of_type(:string) }
    it { is_expected.to have_db_column(:lat).of_type(:string) }
    it { is_expected.to have_db_column(:address_id).of_type(:integer) }
    it { is_expected.to have_db_column(:deleted_at).of_type(:datetime) }
  end

  describe 'indices' do
    it { should have_db_index(:deleted_at) }
    it { should have_db_index(:address_id) }
  end
end
