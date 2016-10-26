require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/dragons_controller')
require_relative('controllers/owners_controller')
require_relative('controllers/adoptions_controller')

get '/' do
  @number_of_dragons=Dragon.total
  @number_of_owners=Owner.total
  @number_of_adoptions=Adoption.total

  @number_of_adoptable_dragons=Dragon.adoptable.count
  @number_of_adopted_dragons=Dragon.adopted.count
  erb :home
end