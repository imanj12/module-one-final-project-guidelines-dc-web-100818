require_relative '../config/environment'

cli = CommandLineInterface.new

input = cli.greet
cli.greet_input(input)
