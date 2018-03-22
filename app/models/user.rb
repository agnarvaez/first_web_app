class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  validates_presence_of :first_name, :last_name, :user_name, length: { maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, :confirmation => true
  validates_length_of :password, :in => 8..30, :on => :create
  has_secure_password
  def full_name
    "#{first_name} #{last_name}"
  end
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end
  def clear_password
    self.password = nil
  end

  def product
    Product.unscoped { super }
  end

  def destroy
     self.destroy!
  end
end
