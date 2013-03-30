require 'tempfile'

class SolutionChecker
  @queue = self.name.underscore

  def self.perform(id)
    solution = Solution.find(id)

    filename = self.create_temp_file solution
    result = self.sandbox_run(filename)

    solution.update_attributes(
                    result: result.to_yaml,
                    status: result.status,
                    )
  end

  def self.create_temp_file solution
    data = {
      code: solution.code,
      language: solution.language,
      input: solution.question.input,
      output: solution.question.output,
    }

    file = Tempfile.new 'solution'
    file.write(data.to_json)
    file.path
  end

  def self.sandbox_run filename
    result = `#{Rails.root}/../sandbox/sandbox #{filename}`
    JSON.load result
  end

  def sandbox
    @sandbox ||= begin
                   RubyPython.start
                   RubyPython.import("sandbox")
                 end
  end

end
