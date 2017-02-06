class MessageService
  class << self
    def create message
      MessageDigest.create digest: digest(message), message: message
    end

    def get message
      MessageDigest.find_by_message(message)
    end

    def digest message
      Digest::SHA256.hexdigest message
    end
  end
end
