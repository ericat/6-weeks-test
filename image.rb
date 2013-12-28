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
    @pixels[y-1][x-1] = color
  end

  def vertical(x, y1, y2, color)
    (y1..y2).each do |y|
      @pixels[y-1][x-1] = color
    end
  end

  def horizontal(x1, x2, y, color)
    (x1..x2).each do |x|
      @pixels[y-1][x-1] = color
    end
  end

  def show
    @pixels.flatten.join("")
  end

  def clear
    @pixels.map {|rows| rows.map! {|pixel| 'O'} }
  end

end


