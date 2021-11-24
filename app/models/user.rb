class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, length: { minimum: 6 }
  has_many :tasks
  before_destroy :reject_destroy_admin
  before_update :reject_update_admin

  def reject_destroy_admin
    if User.where(admin: true).count == 1
      user = User.where(admin: true)
      throw :abort if user[0] == self
    end
  end
  def reject_update_admin
    if User.where(admin: true).count == 1 && admin == false
      user = User.where(admin: true)
      if user[0] == self
        errors.add(:user, '更新エラー。現在管理人が他にいないため管理人から外れることはできません。')
        throw :abort
      end
    end
end
end
