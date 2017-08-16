class SwiftMethod < SwiftEntityElement
  attr_accessor :paramTypes
  
  def initialize(name, type, accessLevel, paramTypes)
    super(name, type, accessLevel)
    @paramTypes = paramTypes
  end

  def to_json(*args)
    @name.gsub!(/[\s]{2,}/, ' ')
    @name.gsub!(/[\n\r]*/, '')

    return JSON.pretty_generate({
      'name' => @name.strip,
      'type' => @type,
      'accessLevel' => @accessLevel
    })
  end
end
