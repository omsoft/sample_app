class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  
  has_secure_password
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },    # this is necessary, since  uniqueness is case sensitive by default!
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
                    
  before_save :downcase_email
  
  private
  
  def downcase_email
    self.email.downcase!
  end
end
