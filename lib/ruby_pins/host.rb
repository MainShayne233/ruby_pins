module RubyPins

  class Host
    attr_accessor :address, :user, :password

    def initialize args
      args.each {|k, v| self.send "#{k}=", v}
    end
  end


end
