require "mathn"
require "rubygems"
require "prawn"

include Math

class Canvas < Prawn::Document

  def self.draw(filename, dims=[300,300], &block)
    width, height = dims

    generate(filename) do
      bounding_box [bounds.width / 2, bounds.height / 2 + height ],
        :width => width, :height => height do
           instance_eval(&block)
        end
    end

  end
  
  def paint_triangle(*points)
    fill_polygon *points
  end

end

Canvas.draw("triangles.pdf") do
  points = Matrix[[0,0], [100,200], [200,100]]
  
  paint_triangle(*points)

  # reflect across y-axis
  points  *= Matrix[[-1, 0],[0,1]]

  # rotate so bottom is flush with x axis.
  theta = -atan(1/2)
  points  *= Matrix[[cos(theta), -sin(theta)],
                      [sin(theta), cos(theta)] ]

  # scale down by 50%
  points  *= 1/2
  paint_triangle(*points)
end




`open triangles.pdf`
