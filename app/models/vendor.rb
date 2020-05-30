# == Schema Information
#
# Table name: vendors
#
#  id            :integer          not null, primary key
#  name          :string
#  email         :string
#  mobile_number :string
#  address       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Vendor < ApplicationRecord

  has_many :invoices, as: :entity

  validates :name, :address, presence: true
  validates :email, presence: true, format:{with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i },uniqueness: {case_sensitive: false, allow_blank: false}, length: { maximum: 250 }
  validates :mobile_number, presence: true, numericality: { only_integer: true }, allow_nil: false
end
