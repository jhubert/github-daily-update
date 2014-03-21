# A reporter is a class that generates a report
# based on the github api and some additional logic
module GithubDailyUpdate::Reporter
  # The base class is the class that reporters extend. All common
  # functionality should go here.
  class Base
    attr_reader :options

    def initialize(client, options = {})
      @client = client
      @options = options
    end

    def generate
      throw 'Generate method needs to be defined in the reporter'
    end
  end
end
