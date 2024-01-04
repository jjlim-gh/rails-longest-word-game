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

  def score
    @checker = JSON.parse("https://wagon-dictionary.herokuapp.com/#{params[:word]}")
  end
end
