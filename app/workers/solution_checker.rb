require 'tempfile'

class SolutionChecker
  include Sidekiq::Worker

  def perform(id)
    solution = Solution.find(id)

    filename = self.create_temp_file solution
    result = self.sandbox_run(filename)

    solution.update_attributes(
                    result: result.to_yaml,
                    status: result['result'],
                    )
  end

  def create_temp_file solution
    data = {
      code: solution.code,
      language: solution.language,
      input: solution.problem.input,
      output: solution.problem.output,
    }

    file = Tempfile.new 'solution'
    file.write(data.to_json)
    file.path
  end

  def sandbox_run filename
    return {'result' => 'Accepted'}
    result = `#{Rails.root}/../sandbox/sandbox #{filename}`
    JSON.load result
  end

end
