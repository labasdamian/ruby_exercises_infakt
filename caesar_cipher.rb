class CeasarCipher
  def initialize(text, shift = 13)
    @text = text
    @shift = shift
  end

  def perform
    alphabet  = Array('a'..'z')
    non_caps  = Hash[alphabet.zip(alphabet.rotate(@shift))]

    alphabet = Array('A'..'Z')
    caps     = Hash[alphabet.zip(alphabet.rotate(@shift))]

    encrypter = non_caps.merge(caps)

    @text.chars.map { |c| encrypter.fetch(c, c) }.join
  end
end
