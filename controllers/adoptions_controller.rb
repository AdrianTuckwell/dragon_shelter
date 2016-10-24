equire 'pry-byebug'
require_relative('../models/adoption.rb')

#index
get '/adoptions' do
  @adoptions = Adoption.all()
  erb :'Adoptions/index'
end