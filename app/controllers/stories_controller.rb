# app/controllers/stories_controller.rb
class StoriesController < ApplicationController
  def show_form
    render({ :template => "stories/the_form.html.erb" })
  end

  def results
    @the_name = params.fetch("person")
    
    client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

    response = client.create_completion(
      engine: "gpt-3.5-turbo",
      prompt: "Create a 5-sentence children's story with detailed descriptions like Isaac Asimov and rhyming like Dr. Seuss based on the name '#{@the_name}':",
      max_tokens: 100,
      n: 1,
      stop: nil,
      temperature: 0.7
    )

    @story = response.choices.first.text.strip
    
    render({ :template => "stories/results.html.erb" })
  end
end
