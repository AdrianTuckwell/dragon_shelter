require 'pry-byebug'
require_relative('../models/owner')

#index
get '/owners' do
  @owners = Owner.all
  erb(:'owners/index')
end
