module ApplicationHelper
	def user_count
		return User.count
	end

	def co_count
		return Cashout.all.where(:paid => false).count
	end

	def task_count
		return SpiffyTask.count
	end
end
