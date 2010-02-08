class Option < ActiveRecord::Base

  def self.set(the_name,value)
    name = the_name.to_s
    v = Option.find(:first, :conditions=>{:name=>name})
    if v.nil?
      v = Option.new({:name=>name, :value=>default_value})
      v.save
    end
  end

  def self.get(the_name, default_value=nil)
    name = the_name.to_s
    v = Option.find(:first, :conditions=>{:name=>name})
    return default_value if v.nil?
    v.value
  end

end
