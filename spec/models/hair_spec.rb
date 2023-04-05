require 'rails_helper'

RSpec.describe Hair, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'db_columns' do
    it { is_expected.to have_db_column(:color).of_type(:string) }
    it { is_expected.to have_db_column(:hair_type).of_type(:string) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:deleted_at).of_type(:datetime) }
  end

  describe 'indices' do
    it { should have_db_index(:deleted_at) }
    it { should have_db_index(:user_id) }
  end
end
