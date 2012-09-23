class Story
  include DataMapper::Resource

  STATUS= [:not_started, :started]

  property :id,         Serial
  property :name,       Text,     required: true
  property :status_id,  Integer,  default: 0

  belongs_to :project
  belongs_to :assignee, :model => 'User', required: false

  def start(user)
    update(assignee: user)
    self.status = :started
  end

  def status
    STATUS[status_id]
  end

  def status=(new_status)
    update(status_id: STATUS.index(new_status))
  end
end
