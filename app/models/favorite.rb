class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :book

  where(:created_at=> 6.months.ago..Time.now)

end
