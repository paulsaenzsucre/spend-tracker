class Category < ApplicationRecord
  belongs_to :user
  has_many :cat_exps

  def total_amount
    cat_exps.joins(:expense).sum(:amount)
  end

  def last_update
    Category.maximum(:updated_at)
  end
end
