require_relative 'editor'

class Command

  def parse(input)
    params = input.split(' ')
    command = params.first
    # well done for creating a class to map command names to method names
    case command
    when 'I'
      @image = Image.new(params[1].to_i, params[2].to_i)
    when 'L'
      @image.color(params[1].to_i, params[2].to_i, params[3])
    when 'V'
      @image.vertical(params[1].to_i, params[2].to_i, params[3].to_i, params[4])
    when 'H'
      @image.horizontal(params[1].to_i, params[2].to_i, params[3].to_i, params[4])
    when "F"
      @image.floodfill(params[1].to_i, params[2].to_i, params[3])
    when "S"
      @image.show
    when 'X'
      exit 0
    else
      "Wrong command, please type again!"
    end
  end

end



