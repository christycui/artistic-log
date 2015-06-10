def set_current_user(user=nil)
  session[:user_id] = (user || Fabricate(:user)).id
end

def sign_in(user=nil)
  visit login_path
  fill_in("Email Address", with: user.email)
  fill_in("Password", with: 'password')
  click_button("Sign In")
end

def register(user=nil)
  visit register_path
  fill_in("Name", with: user.name)
  fill_in("Email Address", with: user.email)
  fill_in("Password", with: user.password)
  click_button("Join!")
end

def clear_current_user
  session[:user_id] = nil
end