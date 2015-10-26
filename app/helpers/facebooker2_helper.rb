<%= fb_connect_async_js %>
<% if current_facebook_user %>
<% current_facebook_user.fetch %>
  <%= "Welcome #{current_facebook_user.first_name} #{current_facebook_user.last_name}!" %>
  or 
  Welcome <%= fb_name(current_facebook_user, :useyou => false) %>!
  <%= fb_logout_link("Logout of fb", request.url) %><br />
<% else
   # you must explicitly request permissions for facebook user fields.
   # here we instruct facebook to ask the user for permission for our website
   # to access the user's facebook email and birthday
   %>
  <%= fb_login_and_redirect('<your URL here>', :scope => 'email,user_birthday') %>
<% end %>