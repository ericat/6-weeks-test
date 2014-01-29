class Image

  attr_reader :pixels

  def initialize(height, width)
    # magic numbers, these could be constants
    raise "Image range must be between 1 and 250" unless height >=1 && width <= 250
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

  # I haven't written a test for it but the implemenation
  # seems incorrect to me. It doesn't take into account the colour
  # of the area you're filling. Your test passes only because you're
  # limiting the area you're filling with the colour used to fill but
  # if you change the colour, it fails.
  # Also, it fails with a stack level too deep error, which shouldn't
  # be happening on a small grid (10x10 in your test).
  # A better approach would be to read the colour of the very first pixel
  # that's being filled and pass it on every recursive call, so that only 
  # the adjacent pixels of that colour were filled.
  def floodfill(x, y, color)
    if @pixels[y-1][x-1] != color
      @pixels[y-1][x-1] = color
      floodfill(x+1, y, color)
      floodfill(x-1, y, color)
      floodfill(x, y + 1, color)
      floodfill(x, y - 1, color)
    end
  end

  def show
    @pixels.flatten.join("")
  end

  def clear
    @pixels.map {|rows| rows.map! {|pixel| 'O'} }
  end

end


