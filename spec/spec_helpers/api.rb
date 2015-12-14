module SpecHelpers
  module Api
    def json_body
      JSON.parse(response.body)
    end

    def show_response_error
      html_msg = response.stream.each.first
      path = "tmp/response.html"
      File.open(path, 'w'){ |f| f.write(html_msg) }
      system("open #{path}")
    end
  end
end
