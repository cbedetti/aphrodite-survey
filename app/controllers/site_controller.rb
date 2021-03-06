class SiteController < ApplicationController
  def index
    @user = User.new()
    if session[:start]
      redirect_to new_answer_path
    end
  end

  def login
    email = params[:user][:email]
    @user = User.find_by_email(email)
    if @user
      if @user.end_of_session != nil
        flash[:alert] = "L'adresse email #{email} a déjà participé au questionnaire. Si c'est une erreur, contactez labo.brambati@gmail.com"
      else
        session[:user_id] = @user.id
        session[:user_name] = @user.name
      end
    else
      flash[:alert] = "L'adresse email #{email} n'a pas été trouvé, êtes vous bien enregistré"
    end
    redirect_to '/'
  end

  def logout
    reset_session
  end

  def start
    @user = User.find(session[:user_id])
    @user.start = Time.now
    @user.end_of_session = Time.now + 90.minutes
    @user.save
    session[:user_id] = @user.id
    session[:user_name] = @user.name
    group_id = @user.id.modulo(12) + 1
    session[:word_ids] = Word.where(group_id: group_id).pluck(:id).shuffle
    session[:total_word] = session[:word_ids].size
    word_id = session[:word_ids].shift
    session[:current_word_id] = word_id
    session[:question_ids] = Question.all.ids
    session[:current_question_id] = session[:question_ids].shift
    session[:start] = @user.start
    session[:end_of_session] = @user.end_of_session
    redirect_to new_answer_path
  end

end
