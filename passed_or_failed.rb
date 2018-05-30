class PassedOrFailed
  def initialize(data = {}, success_rate)
    @data = data
    @success_rate = success_rate.to_i
    convert_data
  end

  def perform
    { passed: passed, failed: failed }
  end

  private

  def passed
    @data.select {|k, v| v >= @success_rate }
  end

  def failed
    @data.select {|k, v| v < @success_rate }
  end

  def convert_data
    @data.each { |key, value| @data[key] = value.to_i }
  end
end
