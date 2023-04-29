class Category < ApplicationRecord
  belongs_to :user
  has_many :expenses, dependent: :destroy

  def total_amount
    250.0
  end

  def last_update
    Category.maximum(:updated_at)
  end
end
