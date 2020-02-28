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

  def eligible
    @chores_today = Chore.all.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).where(:spiffy_task_id => self.spiffy_task_id).count
    @max_redemptions = self.spiffy_task.redemptions
    if @chores_today.to_i <= @max_redemptions.to_i
      return true
    else
      return false
    end
  end

  def val
  	return self.spiffy_task.value
  end

end
