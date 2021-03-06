# == Schema Information
#
# Table name: episodes
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  permalink      :string(255)
#  description    :text(65535)
#  notes          :text(65535)
#  published_at   :datetime
#  seconds        :integer
#  file_sizes     :text(65535)
#  created_at     :datetime
#  updated_at     :datetime
#  user_id        :integer
#  comments_count :integer          default(0)
#  still          :string(255)
#  publish        :boolean
#  position       :integer          default(0)
#  video_url      :string(255)
#  download_url   :string(255)
#  election_id    :integer
#  votes_count    :integer          default(0)
#  allow_download :boolean
#  allow_comment  :boolean
#

class EpisodesController < ApplicationController
  before_action :admin_required, only: [:new, :create, :edit, :update]
  before_action :fetch_episode, only: [:show, :edit, :update]

  def index
    @episodes = Episode.published.by_tag(params[:tag_id]).by_keywords(params[:query]).page(params[:page])
    respond_to do |format|
      format.html
      format.rss
    end
  end

  def show
    @vote = @episode.votes.find_or_initialize_by(user_id: current_user.id) if current_user.present?
  end





 

private
  def fetch_episode
    @episode ||= Episode.find_by(permalink: params[:id])
  end
end
