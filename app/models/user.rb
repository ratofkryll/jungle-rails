class User < ActiveRecord::Base

  has_secure_password validations: false

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, case_sensitive: false
  validates :password, length: { minimum: 6 }

  before_save :downcase_email

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by(email: email)
    @user.authenticate(password)
  end

  private

  def downcase_email
    self.email.downcase!
  end

end
