require 'lib/itunes_library_parser'

class MoviesController < ApplicationController

  def index
    parse_items
    if params[:genre].nil?
      @movies = MovieItem.find(:all, :order=>[:name])
    else
      @movies = MovieItem.find(:all, :conditions=>{:genre=>params[:genre]}, :order=>[:name])
    end
    respond_to do |format|
      format.rss
      format.html
    end
  end

  def genres
    parse_items
    @genres = ActiveRecord::Base.connection.select_values("select distinct genre from movie_items order by genre")
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
