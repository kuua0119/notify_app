class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    current_user.active_relationships.create(followed_id: @user.id)
    redirect_to @user
  end

  def destroy
    current_user.active_relationships.find_by(followed_id: @user.id)&.destroy
    redirect_to @user
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
