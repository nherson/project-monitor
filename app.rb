require 'sinatra'
require 'sinatra/activerecord'
require './lib/project.rb'
require 'json'
## For debugging
require 'byebug'

class ProjectMonitor < Sinatra::Base

  register Sinatra::ActiveRecordExtension

  set :public_folder, 'public'

  get '/' do
    @projects = Project.all.order(:group_number)
    erb :index
  end

  post '/projects/create' do
    project = Project.new(group_number: params[:group_number].to_i, title: params[:title], github_shortname: params[:github_shortname])
    if project.save
      content_type :json
      project.to_json
    else
      status 500
      project.errors.to_json
    end
  end

  get '/projects/:group_number' do
    @project = Project.find_by_group_number(params[:group_number])
    erb :project
  end
end


