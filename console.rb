require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require('pry-byebug')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer1 = Customer.new( {'name' => 'Max', 'funds' => 13.20} )
customer1.save()
# customer2 = Customer.new( {'name' => 'Carlos', 'funds' => 25.80} )
# customer2.save()
# customer3 = Customer.new( {'name' => 'Cookie', 'funds' => 9.00} )
# customer3.save()
# customer4 = Customer.new( {'name' => 'Cyrus', 'funds' => 44.20} )
# customer4.save()


film1 = Film.new( {'title' => 'Terminator', 'price' => 10} )
film1.save()
# film2 = Film.new( {'title' => 'Titanic', 'price' => 2.0} )
# film2.save()
# film3 = Film.new( {'title' => 'Seven', 'price' => 12.50} )
# film3.save()
# film4 = Film.new( {'title' => 'Bad Boys 2', 'price' => 6.40} )
# film4.save()
# film5 = Film.new( {'title' => 'Cars', 'price' => 3.50} )
# film5.save()

ticket1 = Ticket.new( {'customer_id' => customer1.id, 'film_id' => film1.id} )
 ticket1.save()
# ticket2 = Ticket.new( {'customer_id' => customer3.id, 'film_id' => film4.id} )
# ticket2.save()
# ticket3 = Ticket.new( {'customer_id' => customer2.id, 'film_id' => film5.id} )
# ticket3.save()
# ticket4 = Ticket.new( {'customer_id' => customer4.id, 'film_id' => film1.id} )
# ticket4.save()
# ticket5 = Ticket.new( {'customer_id' => customer2.id, 'film_id' => film3.id} )
# ticket5.save()
# ticket6 = Ticket.new( {'customer_id' => customer3.id, 'film_id' => film1.id} )
# ticket6.save()
# ticket7 = Ticket.new( {'customer_id' => customer1.id, 'film_id' => film4.id} )
# ticket7.save()









binding.pry
nil