class User < ApplicationRecord
  belongs_to :role

  VALID_REGEX_NAME = /[a-zA-Z]+/
  VALID_REGEX_EMAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :first_name,
            presence: true,
            format: { with: VALID_REGEX_NAME },
            length: { minimum: 3,
                       message: "Too short. The minimum length is 3 characters." }

  validates :middle_name,
            presence: true,
            format: { with: VALID_REGEX_NAME },
            length: { minimum: 3,
                      message: "Too short. The minimum length is 3 characters." }

  validates :last_name,
            presence: true,
            format: { with: VALID_REGEX_NAME },
            length: { minimum: 3,
                      message: "Too short. The minimum length is 3 characters." }

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: VALID_REGEX_EMAIL }

  validates :password,
            presence: true,
            length: { minimum: 6}

  scope :user_authenticate, -> (params) do
    where("email = ? and password = ?", params[:email], params[:password])
  end
end
