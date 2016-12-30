class WeekTablesController < ApplicationController
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


  private

    def week_table_params

       params.require(:week_table).permit!
     end

end
