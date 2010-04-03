class MovieItem < ActiveRecord::Base

  def self.read_from_library
    MovieItem.delete_all
  end

  # The human duration (the 
  # total_time member is in 
  # milliseconds)
  def human_duration
    hrs = ((total_time/1000)/60)/60
    min = ((total_time/1000)/60) - (hrs*60)
    result = ""
    result += "#{hrs} hrs " if hrs > 0
    result += "#{min} min" if min > 0
    result.strip
  end

end
