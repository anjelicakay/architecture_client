class Building
  attr_accessor :id, :name, :address, :height, :construction_date, :architect

  def initialize(input_options)
    @id = input_options["id"]
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

  def self.create(input_options)
    response = HTTP.post("http://localhost:3000/api/buildings",
                          form: input_options)
    building_hash = response.parse
    Building.new(building_hash)
  end

  def self.find(input_id)
    response = HTTP.get("http://localhost:3000/api/buildings/#{input_id}")
    building_hash = response.parse
    Building.new(building_hash)
  end  

  def update(input_options)
    response = HTTP.patch("http://localhost:3000/api/buildings/#{ self.id }",
                            form: input_options)
    building_hash = response.parse
    Building.new(building_hash)
  end

  def destroy
    response = HTTP.delete("http://localhost:3000/api/buildings/#{id}")
  end

end  