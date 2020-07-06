# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DocumentHelper, type: :helper do
  let(:user) { Users::CreateService.new(username: 'user', email: 'curaga@example.com', password: 'password').execute }
  let(:document) { user.documents.create(slug: 'document-title', namespace: user.default_namespace) }

  describe '#path_for_document' do
    context 'when site default namespace' do
      before do
        allow(controller).to receive(:controller_name).and_return('root')
      end

      it 'returns the root path when default doc' do
        document.namespace.update(default_doc_id: document.id)

        expect(helper.path_for_document(document)).to eq('/')
      end

      it 'returns the root doc path when other document' do
        expect(helper.path_for_document(document)).to eq('/document-title')
      end
    end
  end

  context 'when normal namespace' do
    it 'returns the namespace root path when default doc' do
      document.namespace.update(default_doc_id: document.id)

      expect(helper.path_for_document(document)).to eq('/@user')
    end

    it 'returns the namespace doc path when other doc' do
      expect(helper.path_for_document(document)).to eq('/@user/document-title')
    end
  end
end
