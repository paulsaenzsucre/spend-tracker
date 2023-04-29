class Category < ApplicationRecord
  belongs_to :user
  has_many :cat_exps
  validates :name, presence: true, length: { maximum: 200 }
  validates :icon, presence: true, length: { maximum: 50 }
  validates :user, presence: true

  def total_amount
    cat_exps.joins(:expense).sum(:amount)
  end

  def last_update
    Category.maximum(:updated_at)
  end
end
