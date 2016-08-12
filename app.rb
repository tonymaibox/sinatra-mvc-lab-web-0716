require 'pry'
require_relative 'config/environment'

class App < Sinatra::Base

	get '/' do
		erb :user_input
	end

	post '/piglatinize' do
		# @user_phrase = params[:user_phrase]
# binding.pry
		@user_phrase = PigLatinizer.new(params[:user_phrase])
     	if @user_phrase.word.split.size > 1 
     		@pig_latinized_phrase = @user_phrase.to_pig_latin(@user_phrase.word) 
     	else 
     		@pig_latinized_phrase = @user_phrase.piglatinize(@user_phrase.word)
    	end
		erb :pig_latin
	end

	# get '/piglatinize' do
	# 	erb :pig_latin
	# end

end