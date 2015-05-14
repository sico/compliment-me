require 'sinatra'
require 'data_mapper'
require 'json'

DataMapper.setup(:default, "sqlite://#{Dir.pwd}/comps.db")

class Compliment
  include DataMapper::Resource
  property :id,        Serial
  property :text, Text
end

DataMapper.auto_upgrade!

get '/' do
	erb :index
end

post '/comps' do
	params = JSON.parse(request.env["rack.input"].read)
	@comp = Compliment.new( text: params['text'] )
	@comp.save
	@comp.to_json
end

get '/comps' do
	comps = Compliment.all
	comps.to_json
end

