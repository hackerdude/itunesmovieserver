class ITunesLibraryParser
  
  LIBRARY_LOCATION  = "#{ENV['HOME']}/Music/iTunes/iTunes Music Library.xml"

  attr_reader :itunes_library_folder

  def parse_music_library
    @parser = XML::Parser.file(Option.get(:library_location, LIBRARY_LOCATION))
    @itunesdict = @parser.parse
    if @itunesdict.root.nil? then
      raise Exception.new "Could not parse ITunes Library!"
    end
    @itunes_library_folder = parse_music_folder
    return true
  end

  def parse_movie_items
    #@itunesdict.find("//dict[key='Movie']/true")
    parse_music_library if @parser.nil?
    MovieItem.delete_all
    @itunesdict.root.find("//dict[key='Movie']").each{|d|
      dict = keys_to_hash(d)
      m = MovieItem.new
      dict.each{|k,v| 
        m[k] = v unless ! m.has_attribute?(k)
      }
      m.save
    }
  end
  
  def keys_to_hash(dict_entry)
    result = {}
    dict_entry.find('key').each{|k|
      key = k.content.sub(' ', '_').downcase.to_sym
      value = nil
      if k.next?
        value = k.next.content
      end
      result[key] = value
    }
    result
  end

  def parse_music_folder
    library_dict = @itunesdict.find_first("//dict[key='Music Folder']")
    hash = keys_to_hash(library_dict)
    return hash[:music_folder]
  end
end
