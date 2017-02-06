require 'rails_helper' 
describe MessageService do
  subject{MessageService}

  it{subject.should respond_to :create}
  it{subject.should respond_to :get}
  it{subject.should respond_to :digest}

  describe 'create' do
    it 'create new digest message' do
      expect{MessageService.create 'foo'}.to change(MessageDigest, :count).by(1)
    end
  end

  describe 'get' do
    it 'return digested message and message' do
      ms = subject.create 'foo' 
      expect(subject.get(ms.digest).digest).to eq subject.digest('foo')
    end
  end

  describe 'digest' do
    it 'return sha256 digested message' do
      expect(subject.digest('foo')).to eq Digest::SHA256.hexdigest 'foo'
    end
  end
end
