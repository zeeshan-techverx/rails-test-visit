class UsersController < ApplicationController
	
	def index
		@users = UserService.list
	end

  def import 
    count = UserService.import_csv(params[:file].path)
    redirect_to users_path, flash: { 
      :notice => "#{count[:added]} records imported and #{count[:updated]} updated out of #{count[:total]}" 
    }
  end
end
