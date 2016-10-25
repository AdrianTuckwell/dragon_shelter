require 'pry-byebug'
require_relative('../models/dragon')

#index
get '/dragons' do
  @dragons = Dragon.all
  erb(:'dragons/index')
end

get '/dragons/adoptable' do
  @dragons = Dragon.adoptable
  erb(:'dragons/adoptable')
end

get '/dragons/adopted' do
  @dragons = Dragon.adopted
  erb(:'dragons/adopted')
end

#new
get '/dragons/new' do
  @dragons = Dragon.all
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
  @dragon = Dragon.find(params[:id])
  erb(:'dragons/edit')
end

#update
put '/dragons/:id' do
  @dragon = Dragon.update(params)
  redirect to("/dragons/#{params[:id]}")
end

#delete
delete '/dragons/:id' do
  Dragon.destroy(params[:id])
  redirect to("/dragons")
end
