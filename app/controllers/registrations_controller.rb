class RegistrationsController < Devise::RegistrationsController
  def update
    new_params = params.require(:member).permit(:email, :nickname, :current_password, :password, :password_confirmation)
    change_password = true
    if params[:member][:password].blank?
      params[:member].delete("password")
      params[:member].delete("password_confirmation")
      new_params = params.require(:member).permit(:email, :nickname)
      change_password = false 
    end

    @member = Member.find(current_member.id) 
    is_valid = false 

    if change_password 
      is_valid = @member.update_with_password(new_params)
    else
      is_valid = @member.update_without_password(new_params)
    end 

    if is_valid
      set_flash_message :notice, :updated 
      sign_in @member, :bypass => true 
      redirect_to after_update_path_for(@member)
    else
      render "edit"
    end
  end

  def destroy
    @member = Member.find(current_user.id)
    @member.is_active = 0
    if @member.save
      sign_out @member
      redirect_to root_path
    else
      render "edit"
    end
  end
end