class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit]
  before_action :authenticate_user!, only: [:change_vision]
  def index
  end

  def create
    @player = Player.new(player_params)
    if user_signed_in?
      @player.user_id = current_user.id
    end
    respond_to do |format|
      if !@player.avaliable_points
        @player.errors.add(:puntos, "Faltan por usar!")
      end
      if @player.avaliable_points && @player.save
        format.html { redirect_to @player, notice: "Personaje creado! #{user_signed_in? ? null : "Codigo de acceso: #{@player.access_code}"}" }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @player = Player.new
  end

  def show
    if !(@player.is_visible || (user_signed_in? && current_user.id == @player.user_id))
      not_found
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if !@player.avaliable_points
        @player.errors.add(:puntos, "Faltan por usar!")
      end
      if @player.avaliable_points && @player.save
        format.html { redirect_to @player, notice: 'Personaje actualizado!' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def change_vision
    player = current_user.players.find_by(slug: params[:player_name])
    vision_status = player.is_visible
    respond_to do |format|

      if player.update(is_visible: !vision_status)
        format.html { redirect_to player, notice: 'Vision del personaje modificada!' }
        format.json { render :show, status: :created, location: player }
      else
        format.html { render :show, status: :unprocessable_entity, location: player  }
        format.json { render json: player.errors, status: :unprocessable_entity }
      end
    end
  end


  private


    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end

    def player_params
      params.require(:player).permit(:name, :race, :player_type, :story, :power, :attack, :defense, :charisma, :spirit, :special_ability)
    end

    def set_player
      @player = Player.find_by(slug: params[:name])
    end
end
