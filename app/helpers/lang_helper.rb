class LangHelper 
  def self.lang_symbol(lang)
    languages = {
      "português" => "pt",
      "portugues" => "pt",
      "inglês" => "en",
      "ingles" => "en",
      "espanhol" => "es"
    }
    languages[lang]
  end
end
