describe TranslateService do
  describe "#call" do
    let(:params) do
      {
        "word" => "Carro",
        "source" => "pt",
        "target" => "inglês",
      }
    end

    let(:translated_text) { "Car" }

    let(:text) { "missing value" }

    it "translate success" do
      translated_text_api = TranslateService.new(params).call
      expect(translated_text_api).to match translated_text
    end

    it "missing target value" do
      params["target"] = ""

      error_api = TranslateService.new(params).call
      expect(error_api).to match text
    end

    it "missing word value" do
      params.delete("word")

      error_api = TranslateService.new(params).call
      expect(error_api).to match text
    end
  end
end
