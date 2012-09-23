class User
  include DataMapper::Resource

  property :id,     Serial
  property :name,   String, required: true

  has n, :stories, child_key: "assignee_id"

end

