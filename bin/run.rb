require_relative '../config/environment'

cli = CommandLineInterface.new

# input = cli.greet
cli.greet_input(cli.greet) # changed because cli.greet returns the input we need for cli.greet_input anyway
