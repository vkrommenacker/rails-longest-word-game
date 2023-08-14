class GamesController < ApplicationController


  def score

    @letters = params[:letters].split()
    def letters_included
      letters = params[:letters].split()
      letters_attempt = params[:word].upcase.chars
      letters_attempt.all? do |letter|
        letters.count(letter) >= letters_attempt.count(letter)
      end
    end

    def english_word
      url = "https://wagon-dictionary.herokuapp.com/#{params[:word].downcase}"
      word_serialized = URI.open(url).read
      word = JSON.parse(word_serialized)
      if letters_included == true
        return word["found"]
      end
    end

      true_false = "#{letters_included} #{english_word}"
      case true_false
      when "true true" then @message = "Congratrulations! #{params[:word].upcase} is a valid English word"
      when "true false" then @message = "Sorry but #{params[:word].upcase} does not seem to be a valid English word"
      when "false " then @message = "Sorry but #{params[:word].upcase} cant be built out of #{@letters}"
      end
 end

  def new

    alphabet = ("A".."Z").to_a
    @letters = []
      10.times do
        @letters << alphabet.sample
      end
   end

  end
