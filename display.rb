require 'hue'
require_relative 'animations/sparkle'
require_relative 'animations/rainbow'
require_relative 'animations/left-to-right-by-line'
require_relative 'animations/cycle-solids'
require_relative 'animations/column-saturation-gradient'
require_relative 'animations/border-gradient'
require_relative 'animations/highlight-triangle'
require_relative 'animations/bouncing-ball'
require_relative 'animations/spiral'
require_relative 'animations/white-sparkle'
require_relative 'animations/stripes'
require_relative 'animations/rain'
require_relative 'animations/circles'

class Display
  def animations
    [
      Animations::WhiteSparkle.new(client),
      Animations::Rainbow.new(client),
      Animations::LeftToRightByLine.new(client),
      Animations::Circles.new(client),
      Animations::CycleSolids.new(client),
      Animations::BorderGradient.new(client),
      Animations::ColumnSaturationGradient.new(client),
      Animations::BouncingBall.new(client),
      Animations::HighlightTriangle.new(client),
      Animations::Rain.new(client),
      Animations::Spiral.new(client),
      Animations::Sparkle.new(client),
      Animations::Stripes.new(client)
    ]
  end

  def run
    loop do

      animations.each do |animation|
        animation.run
        sleep 1
      end
    end
  end

  def client
    @client ||= Hue::Client.new
  end
end

display = Display.new
display.run
