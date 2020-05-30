# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  invoice_id  :integer
#  name        :string
#  code        :string
#  rate        :decimal(10, 2)
#  quantity    :integer
#  total_price :decimal(10, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  belongs_to :invoice, optional: true
end
