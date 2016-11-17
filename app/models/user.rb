class User < ApplicationRecord
  belongs_to :role
  has_many :bookings

  VALID_REGEX_NAME = /[a-zA-Z]+/
  VALID_REGEX_EMAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  enum role: { admin: 1, n_user: 2, walk_in: 3 }

  validates :first_name,
            presence: true,
            format: { with: VALID_REGEX_NAME },
            length: { minimum: 3,
                      message: "Too short. The minimum length"\
                               " is 3 characters." }

  validates :middle_name,
            presence: true,
            format: { with: VALID_REGEX_NAME },
            length: { minimum: 3,
                      message: "Too short. The minimum length"\
                               " is 3 characters." }

  validates :last_name,
            presence: true,
            format: { with: VALID_REGEX_NAME },
            length: { minimum: 3,
                      message: "Too short. The minimum length"\
                               " is 3 characters." }

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: VALID_REGEX_EMAIL }

  validates :password,
            presence: true,
            length: { minimum: 6 }

  before_validation :set_role, on: :create
  before_create :set_role

  def self.authenticate(params)
    find_by(email: params[:email], password: params[:password])
  end

  def self.check_email(params)
    find_by(email: params[:email])
  end

  def self.get_walk_in
    find_by(role_id: User.roles[:walk_in])
  end

  private

  def set_role
    self.role_id ||= Role.find_by(role_name: Role.role_names["n_user"]).id
  end
end
