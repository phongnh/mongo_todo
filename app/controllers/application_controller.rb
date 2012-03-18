class ApplicationController < ActionController::Base
  protect_from_forgery


  protected

    def log(name, var)
      puts '='*100
      puts "#{name} = #{var.inspect}"
      puts '='*100
    end

end
