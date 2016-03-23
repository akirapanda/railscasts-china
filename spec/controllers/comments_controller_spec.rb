# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  episode_id :integer
#  user_id    :integer
#  content    :text(65535)
#  created_at :datetime
#  updated_at :datetime
#  ancestry   :string(255)
#
# Indexes
#
#  index_comments_on_ancestry  (ancestry)
#

require 'spec_helper'

describe CommentsController do
  let(:episode) { double(:episode, class: Episode)}
  let(:user) { double(:user) }

  before do
    Episode.stub(:find_by).and_return(episode)
    controller.stub(:current_user).and_return(user)
  end

  describe "POST 'create'" do
    it "returns http success" do
      pending
      post 'create', episode_id: 'episode'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      pending
      get 'edit', episode_id: 'episode', id: 12
      response.should be_success
    end
  end

  describe "PATCH 'update'" do
    it "returns http success" do
      pending
      patch 'update', episode_id: 'episode', id: 12
      response.should be_success
    end
  end

end
