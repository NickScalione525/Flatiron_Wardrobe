<% @errors && @errors.each do |e| %>
    <li><%=e%></li>
    <%end%>


    <%=render('form')%>