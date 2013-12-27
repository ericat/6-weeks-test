class Image

  attr_reader :pixels

  def initialize(height, width)
    @pixels = Array.new(height) { Array.new(width) {'O'} }
  end

  def height
    @pixels.size
  end

  def width
    @pixels.first.size
  end

  def color(x, y, color)
    @pixels[y][x] = color
  end

  def clear
    @pixels.map {|rows| rows.map! {|pixel| 'O'} }
  end

end


