class User < ActiveRecord::Base
  has_secure_password

  has_many :auctions, dependent: :destroy

  has_many :bids, dependent: :destroy

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true,
            format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :password, presence: true

  def name_display
    if first_name || last_name
      "#{first_name} #{last_name}".strip.squeeze(" ")
    else
      email
    end
  end



end
