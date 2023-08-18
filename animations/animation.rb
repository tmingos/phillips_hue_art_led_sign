require_relative '../config'

module Animations
  class Animation
    include Config

    attr_reader :client

    def initialize(client)
      @client = client
    end

    def lights
      client.lights
    end

    def clear_display
      lights.each do |light|
        light.off!
      end
      sleep 1
    end

    def pixel(id)
      client.light(bulb(id))
    end

    def run
      animate
    end
  end
end
