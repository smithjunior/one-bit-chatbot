require "rest-client"

class TranslateService
  def initialize(params)
    @word = params["word"]
    @source = params["source"]
    @target = params["target"]
    @source_symbol = params["source"].length > 2 ? LangHelper.lang_symbol(params["source"]&.downcase) : params["source"]
    @target_symbol = params["target"].length > 2 ? LangHelper.lang_symbol(params["target"]&.downcase) : params["target"]
  end

  def call
    return "missing value" if @word.nil? || @target.nil? || @target.empty?

    RestClient.log = "stdout"
    headers = {
      "X-RapidAPI-Host" => "google-translate1.p.rapidapi.com",
      "X-RapidAPI-Key" => ENV["API_KEY"],
      "Accept-Encoding" => "application/gzip",
    }

    url = "https://google-translate1.p.rapidapi.com/language/translate/v2"

    r = RestClient.post url, { source: @source_symbol, q: @word, target: @target_symbol }, headers

    "Palavara #{@word} em #{@target} é: #{JSON.parse(r.body)["data"]["translations"][0]["translatedText"]}"
  rescue RestClient::ExceptionWithResponse => e
    e.response
  end
end
