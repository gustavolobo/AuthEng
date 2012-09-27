module AuthEng
  class Role < ActiveRecord::Base
    attr_accessible :name
    
    validates_presence_of :name
    
    has_many :users
  end
end
