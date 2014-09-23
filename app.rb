class App < ApplicationController
  # session NEW
  get('/') do
      if session[:current_user] # if there is a user set in the session
        redirect to("/viewers/#{session[:current_id]}")
      else
        render(:erb, :'session/new')
      end
  end

  # session CREATE
  post('/session') do
    # look up the user by the name in params
    user = Viewer.find(name: params[:user_name])
    if user.nil? # if there was no user found with that name
      # flash is like session, except it only lasts for ONE MORE request!
      flash[:error] = "No user found with that name!"
      redirect to('/')
    else
      # add a user to the session hash
      current_user_id = user.id
      session[:current_user]  = {id: current_user_id}
      redirect to("/viewers/#{current_user_id}")
    end
  end

  # password encryption
  post('/login') do
    viewers = Viewer.all
    viewers.each do |viewer|
      if viewer.name == params[:user_name]
        if viewer.password == BCrypt::Engine.hash_secret(params[:password], viewer.salt)
        session[:current_user] = params[:user_name]
        session[:current_id] = viewer.id
        redirect to("/")
        else
        flash[:error] = "Incorrect password!"
        redirect to('/')
        end
      end
    end
  end


  # session DELETE
  delete('/session') do
    # clear out the user from the session
    session[:current_user] = nil
    redirect to('/')
  end

  get('/viewers') do
  end

  get('/viewers/new') do
    render(:erb, :"viewers/new")
  end

  # viewer SHOW
  get('/viewers/:id') do
    @viewer = Viewer.find(id: params[:id])
    render(:erb, :'viewers/show')
  end

  post('/viewers') do
    salt = BCrypt::Engine.generate_salt
    password = BCrypt::Engine.hash_secret(params[:password], salt)
    new_viewer = Viewer.create(name: params[:name], salt: salt, password: password)
    id = new_viewer.id
    flash[:notice] = "Thanks for signing up"
    redirect to("/viewers/#{id}")
  end

end
