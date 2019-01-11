<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: dwc1
  Date: 10/01/2019
  Time: 11:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>getting form data and doing something with it</title>
</head>

<body>
<% Map<String, String[]> map =request.getParameterMap(); %>

<% if (map.keySet().isEmpty()){
    %>
<div id="container">
    <h1>ICT-Gradschool Midterm Questionnaire</h1>

    <!-- Naming convention for controls as suggested by Dr Nichols: nameOfField_TypeOfField_AttrName,
            e.g. city_text_id and city_text_name -->

    <form action="FormData.jsp" method="GET">

        <fieldset>
            <legend>Your details</legend>

            <p>
                <label for="name_id" class="question">Name:</label>
                <input type="text" required="required" autofocus="autofocus" size="50" name="name" id="name_id"
                       placeholder="Your name goes here"/>
            </p>

            <p>
                <label for="email_id" class="question">Email:</label>
                <input type="email" size="50" placeholder="Enter a university email address" name="e-mail"
                       id="email_id"/>
                <span id="email_error"></span>
            </p>

            <p>
                <label for="city_id" class="question">Your city:</label>
                <!-- Note that it's not input type, but input list for using a datalist -->
                <input list="cities_list" type="text" size="50" placeholder="Choose your city or enter one" name="city"
                       id="city_id"/>
            </p>

            <datalist id="cities_list">
                <option value="Auckland">Auckland</option>
                <option value="Christchurch">Christchurch</option>
                <option value="Hamilton">Hamilton</option>
            </datalist>

        </fieldset>

        <fieldset>
            <legend>Questionnaire</legend>

            <p class="question">How are you finding the course? Tick all applicable:</p>
            <p>
                <input type="checkbox" name="thoughts[]" id="like_check_id" value="Enjoying it"/> <label
                    for="like_check_id">Enjoying it</label>
                <input type="checkbox" name="thoughts[]" id="challenging_check_id" value="Challenging"/> <label
                    for="challenging_check_id">Challenging</label>
                <input type="checkbox" name="thoughts[]" id="catchup_check_id" value="Still catching up"/> <label
                    for="catchup_check_id">Still catching up</label>
                <input type="checkbox" name="thoughts[]" id="hard_check_id" value="Too hard"/> <label
                    for="hard_check_id">Too hard</label>
                <input type="checkbox" name="thoughts[]" id="many_check_id" value="Too many exercises"/> <label
                    for="many_check_id">Too many exercises</label>
                <input type="checkbox" name="thoughts[]" id="notenough_check_id" value="Not enough exercises"/> <label
                    for="notenough_check_id">Not enough exercises</label>
                <input type="checkbox" name="thoughts[]" id="confused_check_id" value="Confused"/> <label
                    for="confused_check_id">Confused</label>
            </p>

            <p class="question">Choose the one that best describes your experience so far:</p>
            <p>
                <input checked="checked" type="radio" name="experience" id="lot_radio_id" value="Learning a lot"/>
                <label>Learning a lot</label>
                <input type="radio" name="experience" id="not_radio_id" value="Not learning enough"/> <label>Not
                learning enough</label>
                <input type="radio" name="experience" id="right_radio_id" value="Okay"/> <label>Okay</label>
            </p>

            <p>
                <span class="question">Rate the course so far on a scale from 1 (poor) to 10 (excellent):</span>
                <input type="number" min="1" max="10" value="6" step="1" name="rating" id="rating_number_id"/>
            </p>

            <div>
                <label for="mammal_id" class="question">Pick your favourite among the animals featured in the course's
                    image gallery exercises:</label>
                <select name="mammal" id="mammal_id">
                    <!-- size=1 by default and not multiple, so single selection -->
                    <option selected="selected" value="Quokka">Quokka</option>
                    <option value="Arctic Fox">Arctic Fox</option>
                    <option value="Wombat">Wombat</option>
                    <option value="Himalayan Pika">Himalayan Pika</option>
                    <option value="Lynx">Lynx</option>
                    <option value="Pallas Cat">Pallas Cat</option>
                    <option value="Pika">Pika</option>
                    <option value="Red Panda">Red Panda</option>
                </select>
            </div>

            <div>
                <p>
                    <label class="question" for="suggestions_id">How can the course be improved? Choose one or
                        more:</label>
                </p>
                <select multiple="multiple" name="suggestions" id="suggestions_id" size="4">
                    <option value="Access to real cuddly animals for petting">Access to real cuddly animals for petting
                        (instead of just animal pictures)
                    </option>
                    <option value="More coffee">More coffee</option>
                    <option value="Free printing">Free printing</option>
                    <option value="More hours in the day">More hours in the day</option>
                    <option value="Free parking">Free parking</option>
                    <option value="Cafe vouchers">Vouchers for the local cafe</option>
                </select>
            </div>

            <p>
                <label class="question" for="comments_id">Additional comments:</label>
            </p>
            <p>
                <textarea name="comments" id="comments_id" rows="5" cols="60"></textarea>
            </p>

        </fieldset>

        <p class="right">
            <input type="submit" name="submit_button" id="submit_id" value="Done!"/>
            <input type="reset" name="reset_button" id="reset_id" value="Clear"/>
        </p>
    </form>

</div>
<%
} else {%>
<% Iterator<Map.Entry<String, String[]>> i = map.entrySet().iterator(); %>
<p> Here's your form data, all jsp'd 'n' stuff</p>
<table style="border-collapse: collapse">
<% while (i.hasNext()){
    Map.Entry<String, String[]> entry = i.next();
    String key = entry.getKey(); //.toUpperCase();
    String[] values = entry.getValue();

    if(key.contains("submit") || key.contains("button")) {
        continue;
    }

    int index = key.indexOf("[]");
    if(index != -1) {
        key = key.substring(0, index);
    }%>


<tr><td style='border: 1px solid black; padding:10px'><%=key%>:</td>



    <%for(String value: values) {%>
<td style='border: 1px solid black; padding:10px'><%= value %></td></tr>
    <%}
}
%>

    <%}%>


</table>

</body>
</html>
