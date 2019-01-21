class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, case_sensitive: false
  validates :password, length: { minimum: 6 }

  before_save :format_email

  private

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by(email: email.downcase.strip)
    @user.authenticate(password)
  end

  def format_email
    self.email.downcase!
    self.email.strip!
  end

end
