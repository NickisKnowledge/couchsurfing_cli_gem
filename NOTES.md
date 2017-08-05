How to Build a CLI Gem

1. Plan your gem, imagine your interface
2. Start with the project structure - Google
3. Start with enter point - the file run
4. force that to build the CLI interface
5. stub out the interface
6. start making things real
7. discover objects.
8. program

Couchsurfing
CLI: -type 'couchsurf continent'
     -then a list of 5 places appears
     -select a place
     -then shows a list of 10 homes available

- A command line interface for couchsurfing a continent which uses https://www.couchsurfing.com/places

user types in 'couchsurf Africa'

Show a list of 5 (random???) places on continent:

1. Egypt - Cairo
2. Morocco - Marrakech
3. South Africa - Cape Town
4. South Africa - Johannesburg
5. Tunisia - Tunis

For which place would you like to view housing accommodations?

user types 2

scrap 5 (random???) 'local hosts' for location

What is a place?
A place has a country
A place has a city
  the city has homes
    the homes have 'hosts'
    the homes have availability
