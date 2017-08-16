class SwiftProperty < SwiftEntityElement

  attr_accessor :dataType
  
  def initialize(name, type, accessLevel, dataType)
    super(name, type, accessLevel)
    @dataType = dataType
  end

  def to_json(*args)
    @name.gsub!(/[\s]{2,}/, ' ')
    @name.gsub!(/[\n\r]*/, '')

    return JSON.pretty_generate({
      'name' => @name.strip,
      'type' => @type,
      'accessLevel' => @accessLevel,
      'dataType' => @dataType
    })
  end
end
