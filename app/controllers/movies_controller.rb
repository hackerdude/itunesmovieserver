require 'lib/itunes_library_parser'

class MoviesController < ApplicationController

  def index
    parse_items
    @movies = MovieItem.find(:all, :order=>[:name])
    respond_to do |format|
      format.rss
      format.html
    end
  end

private

  def parse_items
    @parser = ITunesLibraryParser.new
    @parser.parse_music_library
    if MovieItem.count == 0
      @parser.parse_movie_items
    end
  end

end
