class TeamsController < ApplicationController
  before_action :set_team, only: %i[show edit update]
  def new
    @team = Team.new
  end
  
  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id
    @team.save
    @team = Team.last
    
    unless Grouping.team_assign?(current_user)
      if @team.save
        @grouping = current_user.groupings.build(team_id: @team.id)
        @grouping.save
        redirect_to edit_team_path(@team.id), notice: "チームを登録しました！"
      else
        render :new
      end        
    else
      redirect_to menus_path, notice: "チームは1チームのみ作成できます。既にチームが作成されています。"
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
    
  end

  private  
  def team_params
    params.require(:team).permit(:name, :remarks)
  end   

  def set_team
    @team = Team.find(params[:id])
  end
end
