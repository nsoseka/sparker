require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_one(:address) }
    it { should have_one(:hair) }
    it { should have_one(:bank) }
    it { should have_one(:company) }
  end

  describe 'db_columns' do
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:maiden_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:age).of_type(:integer) }
    it { is_expected.to have_db_column(:gender).of_type(:string) }
    it { is_expected.to have_db_column(:phone).of_type(:string) }
    it { is_expected.to have_db_column(:username).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:password).of_type(:string) }
    it { is_expected.to have_db_column(:image).of_type(:string) }
    it { is_expected.to have_db_column(:blood_group).of_type(:string) }
    it { is_expected.to have_db_column(:height).of_type(:string) }
    it { is_expected.to have_db_column(:weight).of_type(:string) }
    it { is_expected.to have_db_column(:eye_color).of_type(:string) }
    it { is_expected.to have_db_column(:domain).of_type(:string) }
    it { is_expected.to have_db_column(:ip).of_type(:string) }
    it { is_expected.to have_db_column(:mac_address).of_type(:string) }
    it { is_expected.to have_db_column(:university).of_type(:string) }
    it { is_expected.to have_db_column(:ein).of_type(:string) }
    it { is_expected.to have_db_column(:ssn).of_type(:string) }
    it { is_expected.to have_db_column(:user_agent).of_type(:string) }
    it { is_expected.to have_db_column(:edited).of_type(:boolean) }
    it { is_expected.to have_db_column(:birth_date).of_type(:date) }
    it { is_expected.to have_db_column(:deleted_at).of_type(:datetime) }
  end

  describe 'indices' do
    it { should have_db_index(:deleted_at) }
  end

  context 'methods' do
    let(:user) { build(:user) }

    describe '#display_name' do
      it 'should respond to display_name' do
        expect(user).to respond_to(:display_name)
      end
    end

    describe '#send account deletion email' do
      it 'should send account deletion email 30 minutes later' do
        expect(user).to respond_to(:send_account_deletion_email)
      end
    end

    describe '#ransackable_associations' do
      it 'should respond to ransackable_associations' do
        expect(User).to respond_to(:ransackable_attributes)
      end
    end


    describe '#ransackable_associations' do
      it 'should respond to ransackable_associations' do
        expect(User).to respond_to(:ransackable_associations)
      end
    end
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:email) }
  end
end
