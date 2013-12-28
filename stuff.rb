require 'pp'

@pixels = Array.new(10) { Array.new(10) {'O'} }
# pp @pixels

def vertical(x, y1, y2, color)
  (y1..y2).each do |y|
    @pixels[y-1][x-1] = color
  end
   # @pixels[y1-1][x-1] = color
   # until y1 == (y2) do
   #   @pixels[y1][x-1] = color
   #   y1 += 1
   # end
   @pixels
end

vertical(7, 6, 10,'C')

pp @pixels