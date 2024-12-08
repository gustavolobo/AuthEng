module AuthEng
  class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
  end
end
