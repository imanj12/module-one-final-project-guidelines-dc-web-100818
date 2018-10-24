require 'rest-client'

def apicommunicator

    json_string = RestClient.get('https://app.ticketmaster.com/discovery/v2/events?apikey=Qp2WTAvTGAHltXmm8Vc8ARAU5qvAx2nw&keyword=930%20Club&city=Washington&countryCode=US&stateCode=DC')

    puts json_string

def

apicommunicator
