class SpiffyTask < ApplicationRecord
	has_many :chores, :dependent => :destroy
end
