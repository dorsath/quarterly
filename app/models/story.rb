class Story
  include DataMapper::Resource

  property :id,     Serial
  property :name,   Text, required: true

  belongs_to :project
end
