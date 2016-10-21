class SayController < ApplicationController
  def hello
  end

  def goodbye
	@time=Time.now
  end
end
