class SettingsController < ApplicationController
  before_action :set_setting, only: [:show, :edit, :update, :destroy]

  # GET /settings/1
  # GET /settings/1.json
  def show
  end

  # GET /settings/1/edit
  def edit
  end

  # PATCH/PUT /settings/1
  # PATCH/PUT /settings/1.json
  def update
    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_to @setting, notice: t('helpers.flash_messages.updated', model: Setting.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Setting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setting_params
      params.require(:setting).permit(:cost_per_thousand_points)
    end
end
