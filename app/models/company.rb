class Company < ApplicationRecord
  acts_as_paranoid
  has_one :address, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :address, allow_destroy: true, reject_if: :all_blank
end
