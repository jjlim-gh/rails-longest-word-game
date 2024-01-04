require "json"
require "open-uri"

class GamesController < ApplicationController
  def index
  end

  def new
    @letters = []
    x = 0
    until x == 10
      @letters << ('a'..'z').to_a.sample
      x += 1
    end
  end

  def checker(url)
    response = URI.open(url).read
    parsed = JSON.parse(response)
    return parsed["found"]
  end

  def score
    word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    result = checker(url)
    @display = ""

    if result == true
      @display = "Congratulations! #{word} is a valid english word!"
    else
      @display = "Sorry, #{word} is not a word!"
    end
  end
end
