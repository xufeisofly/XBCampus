require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe Comment do
    let(:company) {FactoryBot.create(:company)}
    let(:post) do 
      FactoryBot.create(:post, company: company)
    end
    let(:user) { FactoryBot.create(:user) }
    before do
      @comment = post.comments.build(content:"this is the first comment", user_id: user.id)
    end

    subject { @comment }

    it { should respond_to (:content) }
  end
end
