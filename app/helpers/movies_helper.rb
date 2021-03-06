require 'etc'

module MoviesHelper
  DEFAULT_MOVIES_PREFIX="http://#{ITunesLibraryParser.local_ip}/~#{Etc.getpwuid.name}/iTunesMovies/"

  def local_to_location(value)
    movies_folder = "#{@parser.itunes_library_folder}Movies/"
    result = value[movies_folder.length-1..value.length]
    prefix = Option.get(:movies_http_url, DEFAULT_MOVIES_PREFIX)
    return "#{prefix}#{result}"
  end

  def in_library_location(value)
    movies_folder = "#{@parser.itunes_library_folder}Movies/"
    return value.include? movies_folder
  end

end
