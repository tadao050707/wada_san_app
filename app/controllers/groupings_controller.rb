class GroupingsController < ApplicationController
  before_action :set_grouping, only: %i[show edit update]

  def new
    @grouping = Grouping.new
  end

  def create
    @team = Team.find(current_user.team.id) # params[team:]
    unless Grouping.team_assign?(@user)
        team = current_user.groupings.select("team_id")
        @user = User.find_by(email: params[:grouping][:email])
        @grouping = @user.groupings.build(team_id: @team.id)
        @grouping.save
        redirect_to team_path(@team.id), notice: "メンバーを登録しました！"     
    else
      redirect_to menus_path, notice: ""
    end
  end

  def edit
  end

  def update
    if @team.update(team_params)
      redirect_to team_path, notice: "チームを編集しました！"
    else
      render :edit
    end
  end

  def show
    @grouping = Grouping.new
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end    

  def set_grouping
    @grouping = Grouping.find(params[:id])
  end
end
