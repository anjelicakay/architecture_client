class Building
  attr_accessor :name, :address, :height, :construction_date, :architect, :id

  def initialize(input_options)
    @name = input_options["name"] 
    @address = input_options["address"]
    @height = input_options["height"]
    @construction_date = input_options["construction_date"]
    @architect = input_options["architect"]
  end


  def self.all 
    response = HTTP.get("http://localhost:3000/api/buildings")
    building_array = response.parse
    array = []
    building_array.each do |building_hash|
      array << Building.new(building_hash)
    end  
    array
  end

  def create
    response = HTTP.post("http://localhost:3000/api/building")
  end

  def self.find(input_id)
    response = HTTP.get("http://localhost:3000/api/buildings/#{input_id}")
    building_hash = response.parse
    Building.new(building_hash)
  end  

end  