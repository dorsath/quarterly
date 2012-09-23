class Project
  include DataMapper::Resource

  property :id,       Serial
  property :name,     Text, required: true

  has n, :stories
  has 1, :repository

  def destroy
    stories.destroy
    super
  end
end
