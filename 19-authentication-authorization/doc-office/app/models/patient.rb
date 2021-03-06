class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments

  validates :name, uniqueness: {message: "custome message"}
  validates :name, :age, :img_url, presence: true
  validates :age, numericality: {greater_than: 100, less_than: 200} 

  validate :nobody_can_be_named_greg
  has_secure_password

  def nobody_can_be_named_greg
    if self.name && self.name.downcase == 'greg'
      self.errors.add(:name, "can not be me")
    end 
  end 


  # def password=(secret)
      # p = BCrypt::Password.create(secret)
      # self.password_digest = p 
  # end 

end
