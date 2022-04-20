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

  def blank_pay_form
    render({ :template => "calculation_templates/pay_form.html.erb"})
  end

  def calculate_pay
    @apr = params.fetch("apr").to_f/100
    @apr_mthly = @apr/12
    @apr_rd = (@apr*100).round(4)
    @apr_display = (@apr_rd).to_s + "%"
    
    @years = params.fetch("years").to_i
    @mths = @years * 12

    @principal = params.fetch("principal").to_f
    @principal_display = @principal.to_s(:currency)

    @monthly_pay = @principal*@apr_mthly*(1 + @apr_mthly)**@mths/((1+@apr_mthly)**@mths - 1)
    @mthly_pay_display = @monthly_pay.to_s(:currency)

    render({ :template => "calculation_templates/pay_results.html.erb"})
  end

  def blank_square_root_form
    render({ :template => "calculation_templates/root_form.html.erb"})
  end

  def calculate_square_root
    @val = params.fetch("value").to_f
    @root = @val**0.5

    render({ :template => "calculation_templates/root_results.html.erb"})
  end
end
