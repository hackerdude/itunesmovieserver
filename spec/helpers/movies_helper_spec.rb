require 'spec_helper'

describe MoviesHelper do

  include MoviesHelper

  it "Should translate local urls to a location" do
    @parser = ITunesLibraryParser.new
    @parser.parse_music_library

    #location = local_to_location("file://localhost/Users/david/Music/iTunes/iTunes%20Music/Movies/Cinderella%20(Two-Disc%20Special%20Edition).m4v")
    #location.should_not == "#"
    #location.should_not be_nil
  end

 

end
