require 'pry'

class PigLatinizer

	attr_accessor :word

	def initialize(word = nil)
		@word = word
	end

	# def piglatinize(word)
	# 	new_word = []
	# 	if word.downcase.start_with?("a","e","i","o","u")
	# 		letter = word.slice!(0)
	# 		# new_word = []
	# 		new_word << word
	# 		new_word << letter
	# 		new_word << "way"
	# 	else
	# 		# new_word = []
	# 		letter = word.slice!(0)
	# 		new_word << word
	# 		new_word << letter.downcase
	# 		new_word << "ay"
	# 		new_word.join
	# 	end
	# 	new_word.join
	# end

	def piglatinize(word)
		alphabet = ('a'..'z').to_a
		vowels = %w[a e i o u]
		consonants = alphabet - vowels

		if vowels.include?(word[0].downcase)
			new_word = word + "way"
		elsif consonants.include?(word[0].downcase) && consonants.include?(word[1]) && consonants.include?(word[2])
			new_word = word[3..-1] + word[0..2] + "ay"
		elsif consonants.include?(word[0].downcase) && consonants.include?(word[1])
			new_word = word[2..-1] + word[0..1] + "ay"
		elsif consonants.include?(word[0].downcase)
			new_word = word[1..-1] + word[0] + "ay"
		end
		new_word
	end

	def to_pig_latin(words)
		new_string = []
		words.split(" ").collect do |each_word|
			new_string << piglatinize(each_word)
		end
		new_string.join(" ")
	end


end