class Role < ApplicationRecord
  has_many :users

  enum role_name: { admin: "ADMIN", n_user: "N_USER", walk_in: "WALK_IN" }

  validates :role_name,
            presence: true
end
