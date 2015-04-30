require 'sinatra'
require 'yaml'

class ProjectMonitor < Sinatra::Base

  set :public_folder, 'public'

  get '/' do
    @config = YAML.load(File.open("./config/projects.yaml"))
    @projects = @config["projects"]
    erb :index
  end

end


