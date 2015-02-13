class HomeController < ApplicationController
  def index
  end

  def get_all_tables(myTables)
    ActiveRecord::Base.connection.tables.each do |table|
        next if table.match(/\Aschema_migrations\Z/)
        next if table.match(/\Aauthentications\Z/)
        next if table.match(/\Acourses_users\Z/)
        klass = table.singularize.camelize.constantize      
        myTables[klass.name] = klass
    end
  end

  def admin_advanced
    @DB = Hash.new
    get_all_tables(@DB)
  end

  def admin_basic
    @users = User.all
  end

  def admin_basic_show
     @user = User.find(params[:id])
  end
end
