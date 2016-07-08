require "ruby_pins/version"

module RubyPins

  class Pin
    attr_accessor :pin, :name, :state

    def initialize args
      args.each {|k, v| self.send "#{k}=", v}
      self.state= :off unless self.state
    end

    def state= state
      self.send state
    end

    def pin= pin
      unexport
      @pin = pin
    end

    def on
      @state = :on
      export
      set_out
      turn_on
    end

    def off
      @state = :off
      unexport
    end

    def turn_on
      set_value 1
    end

    def set_out
      set_direction 'out'
    end

    def send_in
      set_direction 'in'
    end

    def set_direction dir
      `echo #{dir} > /sys/class/gpio/gpio#{self.pin}/direction`
    end

    def set_value val
      `echo #{val} > /sys/class/gpio/gpio#{self.pin}/value`
    end

    def export
      `echo #{self.pin} > /sys/class/gpio/export`
    end

    def unexport
      `echo #{self.pin} > /sys/class/gpio/unexport`
    end

  end

end


