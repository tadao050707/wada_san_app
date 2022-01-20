class GroupingsController < ApplicationController
  before_action :set_grouping, only: %i[show] #destroy]

  def new
    @grouping = Grouping.new
  end

  def create
    @team = Team.find(current_user.team.id) # params[team:]
    unless Grouping.team_assign?(@user)
        @user = User.find_by(email: params[:grouping][:email])
        @grouping = @user.groupings.build(team_id: @team.id)
        @grouping.save
        redirect_to team_path(@team.id), notice: "メンバーを登録しました！"     
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @team = Team.find(current_user.team.id)
    # @team = Team.find(params[:id])
    @grouping = Grouping.find(params[:id])
    @grouping.destroy
    # redirect_to team_path.(@team.id), notice:"メンバーを削除しました！"
  end

  private
  def user_params
    params.require(:user).permit(:email)
  end    

  def set_grouping
    @grouping = Grouping.find(params[:id])
  end
end
