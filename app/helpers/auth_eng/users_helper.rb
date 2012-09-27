module AuthEng
  module UsersHelper
    
    def roles_to_form(user)
      roles = []
      Role.all.each do |r| 
        roles << [r.name, r.id, {:checked => user.nil? ? false : (r.id == user.role_id.to_i)}]
      end
      roles
    end
    
  end
end
