class Deal < ApplicationRecord
  validates :customer, :description, :closing_date_probability, :value,
            presence: { message: 'You need to fill all fields!' }
  enum status: %i[pending won lost]
end
