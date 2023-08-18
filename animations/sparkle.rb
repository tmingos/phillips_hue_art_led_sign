require_relative 'animation'

module Animations
  class Sparkle < Animation
    def run
      4.times do
        lights.shuffle.each do |light|
          light.on!
          light.set_state({:brightness => 255})
          sleep 0.05
          light.set_state({:brightness => 0})
          light.off!
        end
      end
    end
  end
end
