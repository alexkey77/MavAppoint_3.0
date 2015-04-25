<%@ page import="java.util.ArrayList" %>
<%@ page  import= "uta.mav.appoint.login.*" %>
<jsp:include page='<%=(String) request.getAttribute("includeHeader")%>' />

<% ArrayList<AdvisorUser> deptAdvisors = new ArrayList<AdvisorUser>();
           deptAdvisors = (ArrayList<AdvisorUser>)session.getAttribute("deptAdvisors");
           
           //Department department = (Department)session.getAttribute("department");%>
<div class="container">
<!-- Panel -->
<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading"><h1>Assign Students To Advisors</h1></div>
  <div class="panel-body">
  	<h2>Ranges - Uses the first letter of the last name</h2>
  	<h4>Low - low end of range </h4>
    <h4>High - High end of the range </h4>
  </div>
  <!-- Table -->
   <script>
  
   function myFunction() {
	   lowRange(); 

	}
   
   function lowRange(){
	   
	   var selects = document.getElementsByTagName("select"), len = selects.length, i;
	   for (i = 0; i < len; i++) {
		    if (selects[i].id == "lowRange") {
		        selects[i].value = selects[i].title;
		    }else if (selects[i].id == "highRange") {
		        selects[i].value = selects[i].title;
		    }else if (selects[i].id == "majors") {
		    	var values = selects[i].title.split(",");
		    	
		    	var opts = selects[i].options;
		    	
		    	
		    	for (var p = 0; p < values.length; p++)
		        {
		            for (var j = 0; j < opts.length; j++)
		            {
		                if (opts[j].innerHTML == values[p])
		                {
		                    opts[j].selected = true;
		                    
		                }
		            }
		        }
		    }
   	}
   }
   
   </script>
    <form method= "post" action= "assign_students">
      <table class="table">
        <thead>
          <tr>
            <th>Advisor</th>
            <th>Low</th>
            <th>High</th>
            <th>Degree</th>
            <th>Major</th>
          </tr>
        </thead>
        <tbody>
       
         <% if (deptAdvisors != null){
        	  
        	  for(int i = 0; i < deptAdvisors.size(); i++){ %>
        		 <tr>
        		 <td><%= deptAdvisors.get(i).getPname()%></td>
        		 <td><select name="lowRange<%=i %>" id="lowRange" title ="<%= deptAdvisors.get(i).getNameLow() %>" class="btn btn-default dropdown-toggle  pull-left" data-toggle="dropdown">
					<option value ="A" >A</option>
					<option value ="B" >B</option>
					<option value ="C" >C</option>
					<option value ="D" >D</option>
					<option value ="E" >E</option>
					<option value ="F" >F</option>
					<option value ="G" >G</option>
					<option value ="H" >H</option>
					<option value ="I" >I</option>
					<option value ="J" >J</option>
					<option value ="K" >K</option>
					<option value ="L" >L</option>
					<option value ="M" >M</option>
					<option value ="N" >N</option>
					<option value ="O" >O</option>
					<option value ="P" >P</option>
					<option value ="Q" >Q</option>
					<option value ="R" >R</option>
					<option value ="S" >S</option>
					<option value ="T" >T</option>
					<option value ="U" >U</option>
					<option value ="V" >V</option>
					<option value ="W" >W</option>
					<option value ="X" >X</option>
					<option value ="Y" >Y</option>
					<option value ="Z" >Z</option></select></td>
        		 <td><select name="highRange<%=i%>"  id="highRange" title ="<%= deptAdvisors.get(i).getNameHigh() %>" class="btn btn-default dropdown-toggle  pull-left" data-toggle="dropdown">
					<option value ="A" >A</option>
					<option value ="B" >B</option>
					<option value ="C" >C</option>
					<option value ="D" >D</option>
					<option value ="E" >E</option>
					<option value ="F" >F</option>
					<option value ="G" >G</option>
					<option value ="H" >H</option>
					<option value ="I" >I</option>
					<option value ="J" >J</option>
					<option value ="K" >K</option>
					<option value ="L" >L</option>
					<option value ="M" >M</option>
					<option value ="N" >N</option>
					<option value ="O" >O</option>
					<option value ="P" >P</option>
					<option value ="Q" >Q</option>
					<option value ="R" >R</option>
					<option value ="S" >S</option>
					<option value ="T" >T</option>
					<option value ="U" >U</option>
					<option value ="V" >V</option>
					<option value ="W" >W</option>
					<option value ="X" >X</option>
					<option value ="Y" >Y</option>
					<option value ="Z" >Z</option></select></td>
        		 <td><select name="degree<%=i %>" id="degree" title ="" class="btn btn-default dropdown-toggle  pull-left" data-toggle="dropdown">
		    		 <option value ="all" >All</option>
		    		 <option value ="undergrad" >Undergrad</option>
		    		 <option value ="graduate" >Graduate</option>
		    		 <option value ="doctorate" >Doctorate</option></select></td>
        		 <td><select multiple="multiple" name = "majors<%=i %>" id="majors" title ="<%=deptAdvisors.get(i).getMajors().toString().substring(1, deptAdvisors.get(i).getMajors().toString().length() -1) %>" class="btn btn-default dropdown-toggle  pull-left" data-toggle="dropdown">
		    		 <% for(int m = 0; m < deptAdvisors.get(i).getMajors().size(); m++) {%>
		    		 <option value ="<%=deptAdvisors.get(0).getMajors().get(m) %>" > <%=deptAdvisors.get(0).getMajors().get(m) %></option>
		    		 <%} %></select></td>
        		 </tr> 
        	<%  }
        
        }else{ %> 
          <tr><th>Something is Wrong<th></tr>
         <% }%>
        
        </tbody>
      </table>
      <div class="panel-footer text-center">
      	<input type="submit" class="btn-lg" value="Submit">
      </div>
       
      </form>
    </div>
   
   </div>
   
    
<<<<<<< HEAD
<%@include file="templates/footer.jsp"%>%>
=======
<%@include file="templates/footer.jsp"%>
>>>>>>> MavAppoint/master
