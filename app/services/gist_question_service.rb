class GistQuestionService

  def initialize(question, client: nil)
    @client = client || GitHubClient.new
    @question = question
    @test = @question.test
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def gist_params
    {
      'description': "A questions about #{@test.title} from TestGuru",
      'public': true,
      'files': {
        'test-guru-question.txt': {
          content: gist_content
        }
      }
    }
  end
end