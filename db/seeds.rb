# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Seed Users
# Seed Categories
i = 1
j = 1
k = 1
3.times do
  user = User.create(
    name: "User#{i}",
    email: "user#{i}@user.com",
    password: '123456',
    confirmed_at: Time.now
  )
  user.confirm

  5.times do
    cat = user.categories.create(
      name: "Category #{j}",
      icon: 'home.svg'
    )

    3.times do
      exp = Expense.create(
        name: "Expense #{k}",
        amount: 100.0,
        author: user
      )

      cat.cat_exps.create(
        expense: exp
      )
      k += 1    
    end
    j += 1
  end

  

  i += 1
end