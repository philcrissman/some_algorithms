class Integration
  attr_accessor :func, :xmin, :xmax, :intervals, :dx

  def initialize(func, xmin = 0, xmax = 10, intervals = 10)
    if !func.respond_to?(:call)
      raise "Plz, func needs to respond to `call`."
    end
    @func = func
    @xmin = xmin.to_f
    @xmax = xmax.to_f
    @intervals = intervals.to_f
    @dx = (xmax - xmin) / intervals
  end

  def rectangle_rule
    # calculate `step` to get #intervals out of xmin..xmax
    area = (xmin...xmax).step(dx).inject(0) do |acc, x|
      acc + (func.call(x) * dx)
    end
    area
  end

  def trapezoid_rule
    # rectangle rule, plus area of the little triangle at the top
    approx = rectangle_rule
    trapz = (xmin...xmax).step(dx).inject(0) do |acc, x|
      # func.call(x) - func.call(x + dx) * dx / 2
      acc + ((func.call(x + dx) - func.call(x)) * dx / 2)
    end
    approx + trapz
  end

  def adaptive_quadrature(max_error)

  end
end
