class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :migrate_db

  def migrate_db
    DataMapper.auto_upgrade!
  end
end
