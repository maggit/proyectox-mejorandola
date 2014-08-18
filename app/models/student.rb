class Student < ActiveRecord::Base
  attr_accessible :email, :city
  validates :email,
            :presence => true,
            :uniqueness => true,
            :format => { :with =>  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Email invalid. Please try again." }
end
