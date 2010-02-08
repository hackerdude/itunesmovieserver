require 'lib/itunes_library_parser'
require 'spec_helper'

describe ITunesLibraryParser do


  it "Can Read The iTunes Library into the XML Parser" do
    @parser = ITunesLibraryParser.new
    @parser.parse_music_library.should be_true
    itunes_library_folder.should_not be_nil
  end

  it "Can get a list of Movie items from the parser" do
    @parser = ITunesLibraryParser.new
    MovieItem.count.should == 0
    @parser.parse_movie_items
    MovieItem.count.should > 0
  end

end
