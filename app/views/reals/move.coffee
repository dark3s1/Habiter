$(".real_<%= @user.position %>").replaceWith('<%=j render "real", real: @real %>')
$("#user_<%= @tar.position %>").replaceWith('<%=j render "real", real: @tar %>')