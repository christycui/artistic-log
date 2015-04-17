def sign_in(user=nil)
  visit login_path
  fill_in("Email Address", with: user.email)
  fill_in("Password", with: user.password)
  click_button("Sign In")
end

def register(user=nil)
    visit register_path
    fill_in("Name", with: user.name)
    fill_in("Email Address", with: user.email)
    fill_in("Password", with: user.password)
    click_button("Join!")
end