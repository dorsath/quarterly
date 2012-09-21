require 'data_mapper'
require 'dm-migrations'


def load_models(*models)
  models.each do |model|
    require_relative "#{Dir.pwd}/app/models/#{model}"
  end

  DataMapper.finalize
  # DataMapper::Logger.new($stdout, :debug)
  DataMapper.auto_migrate!

end

DataMapper.setup(:default, 'mysql://root@localhost/whenever_test')

