class Project < ActiveRecord::Base
	has_many :tickets

  	validates :name, presence: true
  	validates :description, presence: true
end
