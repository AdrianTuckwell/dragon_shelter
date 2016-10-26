require 'pry-byebug'
require_relative('../models/adoption.rb')
require_relative('../models/dragon')
require_relative('../models/owner')

#index ------------------------------------------------------------
get '/adoptions' do
  @adoptions = Adoption.all()
  erb :'Adoptions/index'
end

#new ---------------------------------------------------------------
get '/adoptions/new' do
  @dragons = Dragon.all()
  @owners = Owner.all()
  erb :'adoptions/new'
end

#create -------------------------------------------------------------
post '/adoptions' do
  # Sinatra from a form will return a ‘params’ hash (it just does),
  # which can be accessed hash element or as a :symbol
  @adoption = Adoption.new(params)
  @adoption.save
  erb :'adoptions/create'
end

#delete -------------------------------------------------------------
delete '/adoptions/:id' do
  Adoption.destroy(params[:id])
  redirect to("/adoptions")
end