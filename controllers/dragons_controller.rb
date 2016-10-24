require 'pry-byebug'
require_relative('../models/dragon')

#index
get '/dragons' do
  @dragons = Dragon.all
  erb(:'dragons/index')
end
