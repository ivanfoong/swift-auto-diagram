class Entity

  @@id = 1

  attr_accessor :id
  attr_accessor :inheritedEntities
  attr_accessor :usageEntities

  attr_accessor :typeString

  attr_accessor :contentsCodeString

  attr_accessor :generics
  attr_accessor :protocols

  attr_accessor :methods
  attr_accessor :properties
  attr_accessor :cases
  attr_accessor :tokens

  def initialize(inheritedEntities, typeString, contentsCodeString)
    @id = @@id
    @@id += 1

    @inheritedEntities = inheritedEntities
    @usageEntities = []

    @typeString = typeString

    @contentsCodeString = contentsCodeString

    @protocols = []
    @generics = []
    @methods = []
    @properties = []
    @cases = []
    @tokens = []
  end

  def to_hash
    hash = {
      'id' => @id,
      'typeString' => @typeString
    }

    if !@properties.empty?
      hash['properties'] = @properties
    end

    if !@methods.empty?
      hash['methods'] = @methods
    end

    if !@protocols.empty?
      hash['protocols'] = @protocols.map { |protocol|
        protocol.id
      }
    end

    if !@generics.empty?
      hash['generics'] = @generics
    end

    if !@cases.empty?
      hash['cases'] = @cases
    end

    if !@usageEntities.empty?
      hash['usages'] = @usageEntities
    end

    return hash
  end

  def to_json(*args)
    return JSON.pretty_generate(to_hash)
  end

end
