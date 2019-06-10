class User < ApplicationRecord
    # before_save :generate_traveller_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trips
  has_many :orders
  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png"
  end


 private

 # def generate_traveller_id
 #     begin
 #         self.traveller_id = SecureRandom.random_number(1_000_000)
 #     end while User.where(traveller_id: self.traveller_id ).exists?
 # end

end
