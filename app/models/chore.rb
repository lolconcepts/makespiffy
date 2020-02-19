class Chore < ApplicationRecord
  belongs_to :spiffy_task
  belongs_to :status
  belongs_to :user

  mount_uploader :evidence, EvidenceUploader
end
