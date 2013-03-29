require 'rubypython'
require 'tempfile'

class SolutionChecker
  @queue = self.name.underscore

  def self.perform(id)
    solution = Solution.find(id)

    filename = self.create_temp_file solution
    result = self.sandbox_run(filename)

    solution.update_attributes(
                    result: result.to_yaml,
                    status: 'Accepted',
                    )
  end

  def self.create_temp_file solution
    file = Tempfile.new 'solution'
    file.write(solution.code)
    file.path
  end

  def self.sandbox_run filename
    return {result: 'ok'}
    s = self.sandbox.Sandbox(['python', filename])
    s.run()
    result = s.probe().rubify
  end

  def sandbox
    @sandbox ||= RubyPython.import("sandbox")
  end

end
