require "initializer_helpers/version"

module InitializerHelpers
  module_function

  def skip_console_rake_generators &block
    skip(console? || generators? || rake?, &block)
  end

  def skip_rake_generators &block
    skip(generators? || rake?, &block)
  end

  def skip_generators &block
    skip(generators?, &block)
  end

  def skip_console &block
    skip(console?, &block)
  end

  def skip_rake_generators_include_jobs_work &block
    skip(generators? || (rake? && !rake_jobs_work?), &block)
  end

  def rake?
    File.basename($0) == 'rake'
  end

  def rake_jobs_work?
    Rake.application.top_level_tasks.include?('jobs:work')
  end

  def console?
    defined? Rails::Console
  end

  def generators?
    defined? Rails::Generators
  end

  private
  module_function

  def skip(condition, &block)
    raise ArgumentError, 'no block given' if block.blank?
    yield unless condition
  end
end
