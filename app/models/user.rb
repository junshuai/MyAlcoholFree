class User < ActiveRecord::Base
  has_one :customer
  has_many :orders
  validates :username, presence: true, uniqueness: true
  has_secure_password

  private
    
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end
end
