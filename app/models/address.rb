class Address < ApplicationRecord
  acts_as_paranoid
  has_one :coordinate, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :company, optional: true

  accepts_nested_attributes_for :coordinate, allow_destroy: true, reject_if: :all_blank
end
