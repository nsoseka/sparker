class User < ApplicationRecord
  acts_as_paranoid
  self.implicit_order_column = :created_at
  broadcasts_to ->(user) { "users-c51808f2-9500-4cb4-b288-1852d2200ed5" }, inserts_by: :prepend, target: :users

  has_one :hair, dependent: :destroy
  has_one :bank, dependent: :destroy
  has_one :address, dependent: :destroy
  has_one :company, dependent: :destroy

  validates_uniqueness_of :email
  validates_presence_of :email, :first_name, :maiden_name, :last_name, :gender, :blood_group

  accepts_nested_attributes_for :hair, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :bank, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :address, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :company, allow_destroy: true, reject_if: :all_blank

  after_destroy :send_account_deletion_email

  def send_account_deletion_email
    GoodbyeJob.set(wait: 30.minutes).perform_later(email, display_name)
  end

  def display_name
    first_name + ' ' + maiden_name + ' ' + last_name
  end

  def self.ransackable_attributes(auth_object = nil)
    ["email", "first_name", "gender", "last_name", "blood_group", "maiden_name", "username"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["address", "bank", "company", "hair"]
  end
end
