class ApplicationController < ActionController::Base

  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    @num = params.fetch("value").to_f
    @square_of_num = @num ** 2
    render({ :template => "calculation_templates/square_results.html.erb"})
  end

  def blank_random_form
    render({ :template => "calculation_templates/random_form.html.erb"})
  end

  def calculate_rand
    @min = params.fetch("min_val").to_f
    @max = params.fetch("max_val").to_f
    @rand = rand(@min..@max)
    render({ :template => "calculation_templates/rand_results.html.erb"})
  end

end
