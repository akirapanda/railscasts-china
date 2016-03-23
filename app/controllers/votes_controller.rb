# == Schema Information
#
# Table name: votes
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  episode_id  :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#  election_id :integer
#

class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_episode, only: [:create, :destroy]

  def create
    if current_user.votes.where(election_id: @episode.election_id).count < @episode.election.max_allowed_vote_per_user
      @episode.votes.create(votes_params.merge(user_id: current_user.id, election_id: @episode.election_id))
      respond_to do |format|
        format.html { redirect_to @episode, notice: 'Vote successful!' }
        format.json
      end
    else
      respond_to do |format|
        format.html { redirect_to @episode, alert: "Vote number per #{@episode.election.name} exceed, allow #{@episode.election.max_allowed_vote_per_user} only" }
        format.json
      end
    end
  end

  def destroy
    Vote.find(params[:id]).destroy
    redirect_to @episode, notice: 'Unvote successful'
  end


private
  def set_episode
    @episode = Episode.find(votes_params[:episode_id])
  end

  def votes_params
    params.require(:vote).permit(:episode_id)
  end
end
