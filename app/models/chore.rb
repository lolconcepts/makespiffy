class Chore < ApplicationRecord
  belongs_to :spiffy_task
  belongs_to :status
  belongs_to :user

  mount_uploader :evidence, EvidenceUploader

  def payOut
  	if self.status_id != 4
  		user = self.user
  		user.addValue(self.val)
  		self.status_id = 4
  		self.save
  		return true
  	else
  		return false
  	end
  end

  def stat
  	return self.status.name
  end

  def val
  	return self.spiffy_task.value
  end

end
