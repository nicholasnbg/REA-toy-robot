class ErrorReporter
  class<<self

    def error(err)
      print_error(err)
    end

    private

    def print_error(err)
      puts "Error: #{err.class.name}"
      puts "Message: #{err.message}"
    end
  end
end
