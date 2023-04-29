class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :cat_exps
  validates :name, presence: true, length: { maximum: 200 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
