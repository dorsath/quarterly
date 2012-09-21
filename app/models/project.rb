class Project
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String, required: true

  has n, :stories
end
