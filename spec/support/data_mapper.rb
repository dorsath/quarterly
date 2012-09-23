require 'data_mapper'
require 'dm-migrations'


def load_models(*models)
  if models[0] == :all
    Dir.foreach("#{Dir.pwd}/app/models/") do |filename|
      if filename[-3..-1] == ".rb"
        require_relative "#{Dir.pwd}/app/models/#{filename}"
      end
    end
  else
    models.each do |model|
      require_relative "#{Dir.pwd}/app/models/#{model}"
    end

  end

  DataMapper.finalize
  # DataMapper::Logger.new($stdout, :debug)
  DataMapper.auto_migrate!
end

DataMapper.setup(:default, 'mysql://root@localhost/whenever_test')

