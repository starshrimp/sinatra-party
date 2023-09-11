require 'sinatra'
require 'csv'
require_relative 'guest.rb'

def parse_csv
  $guests = []
  CSV.foreach('guests.csv', headers: true) do |row|
    if row.size != 3 
      puts "[ERROR] Something's wrong with this curriculum line: #{row}!"
      return
    end
    name = row[0]
    friends = row[1]
    time = row[2]
    guest = Guest.new(name, friends, time)
    $guests.push(guest)
  end
end

before do
  parse_csv
end

get '/index' do
  erb :index, locals: {guests: $guests }
end

get '/guest_list' do
  erb :guest_list, locals: {guests: $guests }
end

get '/form' do
  erb :form, locals: {guests: $guests }
end
