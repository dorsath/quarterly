class Repository
  include DataMapper::Resource

  property :id,     Serial

  belongs_to :project
end
