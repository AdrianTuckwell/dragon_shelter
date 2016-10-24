require 'pry-byebug'
require_relative('../models/dragon')

#index
get '/dragons' do
  @dragons = Dragon.all
  erb(:'dragons/index')
end

#new
get '/dragons/new' do
  erb(:'dragons/new')
end

#create
post '/dragons' do
  @dragon = Dragon.new(params)
  @dragon.save
  redirect to( "dragons" )
end

#show
get '/dragons/:id' do
  @dragon = Dragon.find(params['id'])
  erb(:'dragons/show')
end

#edit
get '/dragons/:id/edit' do
end

#update
post '/dragons/:id' do
end

#delete
delete '/dragons' do
end