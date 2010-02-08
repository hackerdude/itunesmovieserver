class MovieItem < ActiveRecord::Base

  def self.read_from_library
    MovieItem.delete_all
  end

end
