class HomeController < ApplicationController
  def index
  	@users = User.all
  end

  def get_all_tables(myTables)
    ActiveRecord::Base.connection.tables.each do |table|
        next if table.match(/\Aschema_migrations\Z/)
        next if table.match(/\Aauthentications\Z/)
        klass = table.singularize.camelize.constantize      
        myTables[klass.name] = klass
    end
  end

  def admin
    @DB = Hash.new
    get_all_tables(@DB)
  end

  def admin_show
    @user = User.find(params[:id])
    @DB = Hash.new
    get_all_tables(@DB)
    @cols = @DB[params[:tb]].columns
  end

end
