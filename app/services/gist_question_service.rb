class GistQuestionService

  def initialize(question, client: setup_http_client)
    @client = client
    @question = question
    @test = @question.test
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ENV['TOKEN_GITHUB_GIST'])
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def gist_params
    {
      'description': I18n.t('sevices.gist.description',title: @test.title),
      'public': true,
      'files': {
        'test-guru-question.txt': {
          content: gist_content
        }
      }
    }
  end
end