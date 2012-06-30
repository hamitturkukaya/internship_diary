class HomeController < ApplicationController
  WillPaginate.per_page = 5
  def index
    if user_signed_in?
      if current_user.education.nil?
        redirect_to new_education_path
      end
    end
    
    @diaries = Diary.where(:private => false).paginate(:page => params[:page]).order('id DESC')
  end
end
