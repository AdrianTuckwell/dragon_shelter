require 'pry-byebug'
require_relative('../owners/book')

#index
get '/owners' do
  @owners = Owner.all
  erb(:'owners/index')
end
