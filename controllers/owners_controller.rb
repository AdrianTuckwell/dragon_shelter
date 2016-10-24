require 'pry-byebug'
require_relative('../models/owner')

#index
get '/owners' do
  @owners = Owner.all
  erb(:'owners/index')
end

#new
get '/owners/new' do
  erb(:'owners/new')
end

#create
post '/owners' do
  @owner = Owner.new(params)
  @owner.save
  redirect to('/owners')
end

#show
get '/owners/:id' do
  @owner = Owner.find(params['id'])
  erb(:'owners/show')
end

#edit
get '/owners/:id/edit' do
end

#update
post '/owners/:id' do
end

#delete
delete '/owners' do
end