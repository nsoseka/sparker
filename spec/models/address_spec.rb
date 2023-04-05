require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'associations' do
    it { should belong_to(:user).optional }
    it { should belong_to(:company).optional }
  end

  describe 'db_columns' do
    it { is_expected.to have_db_column(:address).of_type(:string) }
    it { is_expected.to have_db_column(:city).of_type(:string) }
    it { is_expected.to have_db_column(:postal_code).of_type(:string) }
    it { is_expected.to have_db_column(:state).of_type(:string) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:company_id).of_type(:integer) }
    it { is_expected.to have_db_column(:deleted_at).of_type(:datetime) }
  end

  describe 'indices' do
    it { should have_db_index(:deleted_at) }
    it { should have_db_index(:user_id) }
    it { should have_db_index(:company_id) }
  end
end
