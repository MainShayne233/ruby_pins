module RubyPins

  class Pin
    attr_accessor :pin, :name, :state, :pinset, :host

    def initialize args
      args.each {|k, v| self.send "#{k}=", v}
      self.state= :off unless self.state
      self.host ||= :local
    end

    def state= state
      self.send state
    end

    def pin= pin
      unexport if self.pin
      @pin = pin
    end

    def on
      @state = :on
      run export, set_out, turn_on
    end

    def off
      @state = :off
      run(unexport) if exported?
    end

    def run *commands
      std_out = ''
      if host == :local
        commands.each {|cmd| std_out << %x(#{cmd})}
      else
        commands.each do |cmd|
          Net::SSH.start(self.host.address, self.host.user, password: self.host.password) do |ssh|
            std_out << ssh.exec! script
          end
        end
      end
      std_out
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
      "echo #{dir} > /sys/class/gpio/gpio#{self.pin}/direction"
    end

    def set_value val
      "echo #{val} > /sys/class/gpio/gpio#{self.pin}/value"
    end

    def export
      "echo #{self.pin} > /sys/class/gpio/export"
    end

    def unexport
      "echo #{self.pin} > /sys/class/gpio/unexport"
    end

    def exported?
      run("ls /sys/class/gpio/").include? "#{self.pin}"
    end

  end

end
