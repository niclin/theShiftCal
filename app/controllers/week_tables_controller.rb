class WeekTablesController < ApplicationController
    before_action :authenticate_user!

  # def edit
  #   @week_table = WeekTable.find(params[:id])
  # end
  #
  #
  #
  #
  # def update
  #     @week_table = WeekTable.find(params[:id])
  #     if @week_table = WeekTable.update(week_table_params)
  #       redirect_to :back, alert:'Your table has been updated!'
  #     else
  #       render :edit
  #     end
  # end
  #

  def index
    @week_tables = WeekTable.all

  end

  def new
    @week_table = WeekTable.new
   @week_table.events.build

  end

  def create

    @week_table = WeekTable.new(week_table_params)

    if @week_table.save!

      redirect_to root_path
    else
      render :new
    end

  end
  def destroy
    @week_table = WeekTable.find(params[:id])
    @week_table.destroy
    redirect_to new_week_table_path, notice: "reset sucessfully, you can create a shift for a new week "
  end


  private

    def week_table_params

       params.require(:week_table).permit!
     end

end
