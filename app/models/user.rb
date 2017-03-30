class User < ApplicationRecord
  # def self.search(find)
  #   results = self.where("first_name like ?", "%#{find}%")
  #   results.or self.where("last_name like ?", "%#{find}%")
  #   results
  # end
  def self.search(find)
    self.where("first_name like ? or last_name like ? or email like ?", "%#{find}%","%#{find}%","%#{find}%")
  end
  # def self.search(string)
  #   where(['first_name ILIKE ? OR last_name ILIKE ?', "%#{string}%", "%#{string}%"]).order(['last_name ILIKE ?', "%#{string}%"], ['first_name ILIKE ?', "%#{string}%"])
  # end
end
