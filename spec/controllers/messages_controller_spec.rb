require 'rails_helper' 
describe MessagesController do
  describe 'create' do
    it 'create new digest message' do
      expect{post :create, params: {message: 'foo'}}.to change(MessageDigest, :count).by(1)
    end

    it 'create and retrun digested message' do
      post :create, params: {message: 'foo'}
      response_body = {digest: MessageService.digest('foo')}.with_indifferent_access
      expect(JSON.parse(response.body)).to eq response_body
    end
  end

  describe 'show' do
    it 'return digested message' do
      ms = MessageService.create 'foo'
      get :show, params: {id: ms.digest}
      response_body = {message: ms.message}.with_indifferent_access
      expect(JSON.parse(response.body)).to eq response_body
    end

    it 'return message not found' do
      ms = MessageService.create 'foo'
      get :show, params: {id: ms.digest + "messup"}
      response_body = {err_msg: "Message not found" }.with_indifferent_access
      expect(JSON.parse(response.body)).to eq response_body
    end
  end
end
