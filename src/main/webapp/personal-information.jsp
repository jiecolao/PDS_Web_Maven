<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link href="assets/tailwind-output.css" rel="stylesheet">
    <title>Personal Information</title>
    <style>
        .section-header {
            font-size: 1.5rem;
            font-weight: bold;
            margin-top: 1rem;
            margin-bottom: 0.5rem;
        }
        .input-container {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        .input-container input {
            flex: 1;
            padding: 0.5rem;
            border: 1px solid #ccc;
            border-radius: 0.25rem;
            background-color: #f9f9f9;
        }
        .input-container input[readonly] {
            background-color: #e9e9e9;
        }
        .icon {
            cursor: pointer;
            font-size: 1.25rem;
        }
        .hidden {
            display: none;
        }
    </style>
</head>
<body>
    <header>
        <%@ include file="dashboard-header.jsp" %>
    </header>
    <div class="m-4">
        <div id="main" class="m-10">
            <div class="section-header text-center my-8 font-[Inter] text-4xl">PERSONAL INFORMATION</div>    
            <%
                Map<String, String> data = (Map<String, String>) request.getAttribute("data");
                if (data != null) {
                    Map<String, String> respondent = data;
            %>
            <div id="personal_info_1" class="grid grid-cols-6 gap-x-8 gap-y-2 font-[Inter] text-xl">
                <label for="fullname" class="flex justify-between items-center"><div class="flex">Full Name</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" id="fullname" name="fullname" value="<%= respondent.get("fullname") %>" readonly>
                    <span class="icon edit-icon" data-field="fullname">&#9998;</span>
                    <span class="icon delete-icon" data-field="fullname">&#128465;</span>
                    <span class="icon check-icon hidden" data-field="fullname">&#10003;</span>
                    <span class="icon cancel-icon hidden" data-field="fullname">&#10060;</span>
                </div>
                <label for="height" class="flex justify-between items-center"><div class="flex">Height (m)</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" id="height" name="height" value="<%= respondent.get("height") %>" readonly>
                    <span class="icon edit-icon" data-field="height">&#9998;</span>
                    <span class="icon delete-icon" data-field="height">&#128465;</span>
                    <span class="icon check-icon hidden" data-field="height">&#10003;</span>
                    <span class="icon cancel-icon hidden" data-field="height">&#10060;</span>
                </div>
                <label for="age" class="flex justify-between items-center"><div class="flex">Date of Birth</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" id="age" name="age" value="<%= respondent.get("age") %>" readonly>
                    <span class="icon edit-icon" data-field="age">&#9998;</span>
                    <span class="icon delete-icon" data-field="age">&#128465;</span>
                    <span class="icon check-icon hidden" data-field="age">&#10003;</span>
                    <span class="icon cancel-icon hidden" data-field="age">&#10060;</span>
                </div>
                <label for="weight" class="flex justify-between items-center"><div class="flex">Weight (kg)</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" id="weight" name="weight" value="<%= respondent.get("weight") %>" readonly>
                    <span class="icon edit-icon" data-field="weight">&#9998;</span>
                    <span class="icon delete-icon" data-field="weight">&#128465;</span>
                    <span class="icon check-icon hidden" data-field="weight">&#10003;</span>
                    <span class="icon cancel-icon hidden" data-field="weight">&#10060;</span>
                </div>
                <label for="birthplace" class="flex justify-between items-center"><div class="flex">Place of Birth</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" id="birthplace" name="birthplace" value="<%= respondent.get("birthplace") %>" readonly>
                    <span class="icon edit-icon" data-field="birthplace">&#9998;</span>
                    <span class="icon delete-icon" data-field="birthplace">&#128465;</span>
                    <span class="icon check-icon hidden" data-field="birthplace">&#10003;</span>
                    <span class="icon cancel-icon hidden" data-field="birthplace">&#10060;</span>
                </div>
                <label for="bloodtype" class="flex justify-between items-center"><div class="flex">Blood Type</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" id="bloodtype" name="bloodtype" value="<%= respondent.get("bloodtype") %>" readonly>
                    <span class="icon edit-icon" data-field="bloodtype">&#9998;</span>
                    <span class="icon delete-icon" data-field="bloodtype">&#128465;</span>
                    <span class="icon check-icon hidden" data-field="bloodtype">&#10003;</span>
                    <span class="icon cancel-icon hidden" data-field="bloodtype">&#10060;</span>
                </div>
                <label for="gender" class="flex justify-between items-center"><div class="flex">Sex</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" id="gender" name="gender" value="<%= respondent.get("gender") %>" readonly>
                    <span class="icon edit-icon" data-field="gender">&#9998;</span>
                    <span class="icon delete-icon" data-field="gender">&#128465;</span>
                    <span class="icon check-icon hidden" data-field="gender">&#10003;</span>
                    <span class="icon cancel-icon hidden" data-field="gender">&#10060;</span>
                </div>              
                <label for="citizenship" class="flex justify-between items-center"><div class="flex">Citizenship</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" id="citizenship" name="citizenship" value="Insert citizenship here" readonly>
                    <span class="icon edit-icon" data-field="citizenship">&#9998;</span>
                    <span class="icon delete-icon" data-field="citizenship">&#128465;</span>
                    <span class="icon check-icon hidden" data-field="citizenship">&#10003;</span>
                    <span class="icon cancel-icon hidden" data-field="citizenship">&#10060;</span>
                </div>                
                <label for="civilstatus" class="flex justify-between items-center"><div class="flex">Civil Status</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" id="civilstatus" name="civilstatus" value="<%= respondent.get("civilstatus") %>" readonly>
                    <span class="icon edit-icon" data-field="civilstatus">&#9998;</span>
                    <span class="icon delete-icon" data-field="civilstatus">&#128465;</span>
                    <span class="icon check-icon hidden" data-field="civilstatus">&#10003;</span>
                    <span class="icon cancel-icon hidden" data-field="civilstatus">&#10060;</span>
                </div>
            </div>
            <div class="section-header my-12 text-gray-600">CONTACT INFORMATION</div>
            <div id="personal_info_2" class="grid grid-cols-6 gap-x-8 gap-y-2 font-[Inter] text-xl">
                <%
                    Map<String, String> dataContact = (Map<String, String>) request.getAttribute("data_contact");
                    if (dataContact != null) {
                %>
                <label for="res_address" class="flex justify-between items-center">
                    <div class="flex">Residential Address</div><div class="flex">:</div>
                </label>
                <div class="input-container col-span-2">
                    <textarea class="text-wrap" id="res_address" name="res_address" readonly style= "resize: none; width: 100%; overflow:hidden"><%= dataContact.get("res_house_no") %> <%= dataContact.get("res_house_street") %>, <%= dataContact.get("res_village") %>, <%= dataContact.get("res_bgy") %>, <%= dataContact.get("res_citymun") %>, <%= dataContact.get("res_prov") %>, <%= dataContact.get("res_zipcode") %>
                    </textarea>
                    <span class="icon edit-icon" data-field="res_address">&#9998;</span>
                    <span class="icon check-icon hidden" data-field="res_address">&#10003;</span>
                    <span class="icon cancel-icon hidden" data-field="res_address">&#10060;</span>
                </div>
                <div class="input-container hidden" id="res_address-edit">
                    <label for="res_house_no">House No:</label>
                    <input type="text" id="res_house_no" name="res_house_no" value="<%= dataContact.get("res_house_no") %>">
                    <label for="res_house_street">Street:</label>
                    <input type="text" id="res_house_street" name="res_house_street" value="<%= dataContact.get("res_house_street") %>">
                    <label for="res_village">Village:</label>
                    <input type="text" id="res_village" name="res_village" value="<%= dataContact.get("res_village") %>">
                    <label for="res_bgy">Barangay:</label>
                    <input type="text" id="res_bgy" name="res_bgy" value="<%= dataContact.get("res_bgy") %>">
                    <label for="res_citymun">City/Municipality:</label>
                    <input type="text" id="res_citymun" name="res_citymun" value="<%= dataContact.get("res_citymun") %>">
                    <label for="res_prov">Province:</label>
                    <input type="text" id="res_prov" name="res_prov" value="<%= dataContact.get("res_prov") %>">
                    <label for="res_zipcode">Zip Code:</label>
                    <input type="text" id="res_zipcode" name="res_zipcode" value="<%= dataContact.get("res_zipcode") %>">
                </div>
                <label for="perm_address" class="flex justify-between items-center"><div class="flex">Permanent Address</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <textarea class="text-wrap"  id="perm_address" name="perm_address" readonly style= "resize: none; width: 100%; overflow:hidden"><%= dataContact.get("perm_house_no") %> <%= dataContact.get("perm_house_street") %>, <%= dataContact.get("perm_village") %>, <%= dataContact.get("perm_bgy") %>, <%= dataContact.get("perm_citymun") %>, <%= dataContact.get("perm_prov") %>, <%= dataContact.get("perm_zipcode") %></textarea>
                    <span class="icon edit-icon" data-field="perm_address">&#9998;</span>
                    <span class="icon check-icon hidden" data-field="perm_address">&#10003;</span>
                    <span class="icon cancel-icon hidden" data-field="perm_address">&#10060;</span>
                </div>
                <div class="input-container hidden" id="perm_address-edit">
                    <label for="perm_house_no">House No:</label>
                    <input type="text" id="perm_house_no" name="perm_house_no" value="<%= dataContact.get("perm_house_no") %>">
                    <label for="perm_house_street">Street:</label>
                    <input type="text" id="perm_house_street" name="perm_house_street" value="<%= dataContact.get("perm_house_street") %>">
                    <label for="perm_village">Village:</label>
                    <input type="text" id="perm_village" name="perm_village" value="<%= dataContact.get("perm_village") %>">
                    <label for="perm_bgy">Barangay:</label>
                    <input type="text" id="perm_bgy" name="perm_bgy" value="<%= dataContact.get("perm_bgy") %>">
                    <label for="perm_citymun">City/Municipality:</label>
                    <input type="text" id="perm_citymun" name="perm_citymun" value="<%= dataContact.get("perm_citymun") %>">
                    <label for="perm_prov">Province:</label>
                    <input type="text" id="perm_prov" name="perm_prov" value="<%= dataContact.get("perm_prov") %>">
                    <label for="perm_zipcode">Zip Code:</label>
                    <input type="text" id="perm_zipcode" name="perm_zipcode" value="<%= dataContact.get("perm_zipcode") %>">
                </div>
                <label for="tel_no" class="flex justify-between items-center"><div class="flex">Telephone Number</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" id="tel_no" name="tel_no" value="<%= dataContact.get("tel_no") %>" readonly>
                    <span class="icon edit-icon" data-field="tel_no">&#9998;</span>
                    <span class="icon delete-icon" data-field="tel_no">&#128465;</span>
                    <span class="icon check-icon hidden" data-field="tel_no">&#10003;</span>
                    <span class="icon cancel-icon hidden" data-field="tel_no">&#10060;</span>
                </div>
                <label for="mobile_no" class="flex justify-between items-center"><div class="flex">Mobile Number</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" id="mobile_no" name="mobile_no" value="<%= dataContact.get("mobile_no") %>" readonly>
                    <span class="icon edit-icon" data-field="mobile_no">&#9998;</span>
                    <span class="icon delete-icon" data-field="mobile_no">&#128465;</span>
                    <span class="icon check-icon hidden" data-field="mobile_no">&#10003;</span>
                    <span class="icon cancel-icon hidden" data-field="mobile_no">&#10060;</span>
                </div>
                <label for="email_addr" class="flex justify-between items-center"><div class="flex">Email Address</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" id="email_addr" name="email_addr" value="<%= dataContact.get("email_addr") %>" readonly>
                    <span class="icon edit-icon" data-field="email_addr">&#9998;</span>
                    <span class="icon delete-icon" data-field="email_addr">&#128465;</span>
                    <span class="icon check-icon hidden" data-field="email_addr">&#10003;</span>
                    <span class="icon cancel-icon hidden" data-field="email_addr">&#10060;</span>
                </div>
                <%
                    } else {
                %>
                        <div>No contact information available</div>
                <%
                    }
                %>
            </div>
            <div class="section-header my-12 text-gray-600">GOVERNMENT AND SOCIAL SERVICE IDENTIFICATIONS</div>
            <div id="peronal_info_3" class="grid grid-cols-6 gap-x-8 gap-y-2 font-[Inter] text-xl">
                <label for="gsis_no" class="flex justify-between items-center"><div class="flex">GSIS ID NO.</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" id="gsis_no" name="gsis_no" value="<%= respondent.get("gsis_no") %>" readonly>
                    <span class="icon edit-icon" data-field="gsis_no">&#9998;</span>
                    <span class="icon delete-icon" data-field="gsis_no">&#128465;</span>
                    <span class="icon check-icon hidden" data-field="gsis_no">&#10003;</span>
                    <span class="icon cancel-icon hidden" data-field="gsis_no">&#10060;</span>
                </div>
                <label for="pagibig_id" class="flex justify-between items-center"><div class="flex">PAG-IBIG ID NO.</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" id="pagibig_id" name="pagibig_id" value="<%= respondent.get("pagibig_id") %>" readonly>
                    <span class="icon edit-icon" data-field="pagibig_id">&#9998;</span>
                    <span class="icon delete-icon" data-field="pagibig_id">&#128465;</span>
                    <span class="icon check-icon hidden" data-field="pagibig_id">&#10003;</span>
                    <span class="icon cancel-icon hidden" data-field="pagibig_id">&#10060;</span>
                </div>
                <label for="philhealth_id" class="flex justify-between items-center"><div class="flex">PhilHealth NO.</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" id="philhealth_id" name="philhealth_id" value="<%= respondent.get("philhealth_id") %>" readonly>
                    <span class="icon edit-icon" data-field="philhealth_id">&#9998;</span>
                    <span class="icon delete-icon" data-field="philhealth_id">&#128465;</span>
                    <span class="icon check-icon hidden" data-field="philhealth_id">&#10003;</span>
                    <span class="icon cancel-icon hidden" data-field="philhealth_id">&#10060;</span>
                </div>
                <label for="sss_no" class="flex justify-between items-center"><div class="flex">SSS NO.</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" id="sss_no" name="sss_no" value="<%= respondent.get("sss_no") %>" readonly>
                    <span class="icon edit-icon" data-field="sss_no">&#9998;</span>
                    <span class="icon delete-icon" data-field="sss_no">&#128465;</span>
                    <span class="icon check-icon hidden" data-field="sss_no">&#10003;</span>
                    <span class="icon cancel-icon hidden" data-field="sss_no">&#10060;</span>
                </div>
                <label for="tin" class="flex justify-between items-center"><div class="flex">TIN NO.</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" id="tin" name="tin" value="<%= respondent.get("tin") %>" readonly>
                    <span class="icon edit-icon" data-field="tin">&#9998;</span>
                    <span class="icon delete-icon" data-field="tin">&#128465;</span>
                    <span class="icon check-icon hidden" data-field="tin">&#10003;</span>
                    <span class="icon cancel-icon hidden" data-field="tin">&#10060;</span>
                </div>
                <label for="agency_empno" class="flex justify-between items-center"><div class="flex">Agency Employee NO.</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" id="agency_empno" name="agency_empno" value="<%= respondent.get("agency_empno") %>" readonly>
                    <span class="icon edit-icon" data-field="agency_empno">&#9998;</span>
                    <span class="icon delete-icon" data-field="agency_empno">&#128465;</span>
                    <span class="icon check-icon hidden" data-field="agency_empno">&#10003;</span>
                    <span class="icon cancel-icon hidden" data-field="agency_empno">&#10060;</span>
                </div>
            </div>   
                <%
                    } else {
                %>
                        <div>No data available</div>
                <%
                    }
                %>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const editIcons = document.querySelectorAll('.edit-icon');
            const deleteIcons = document.querySelectorAll('.delete-icon');
            const checkIcons = document.querySelectorAll('.check-icon');
            const cancelIcons = document.querySelectorAll('.cancel-icon');
    
            editIcons.forEach(icon => {
                icon.addEventListener('click', function() {
                    const field = icon.getAttribute('data-field');
                    const input = document.getElementById(field);
                    input.removeAttribute('readonly');
                    input.focus();
                    icon.classList.add('hidden');
                    document.querySelector(`.delete-icon[data-field="${field}"]`).classList.add('hidden');
                    document.querySelector(`.check-icon[data-field="${field}"]`).classList.remove('hidden');
                    document.querySelector(`.cancel-icon[data-field="${field}"]`).classList.remove('hidden');
                });
            });
    
            deleteIcons.forEach(icon => {
                icon.addEventListener('click', function() {
                    const field = icon.getAttribute('data-field');
                    const input = document.getElementById(field);
                    input.removeAttribute('readonly');
                    input.value = '';
                    input.focus();
                    icon.classList.add('hidden');
                    document.querySelector(`.edit-icon[data-field="${field}"]`).classList.add('hidden');
                    document.querySelector(`.check-icon[data-field="${field}"]`).classList.remove('hidden');
                    document.querySelector(`.cancel-icon[data-field="${field}"]`).classList.remove('hidden');
                });
            });
    
            checkIcons.forEach(icon => {
                icon.addEventListener('click', function() {
                    const field = icon.getAttribute('data-field');
                    const input = document.getElementById(field);
                    const value = input.value;
                    // Invoke UpdateInfoServlet with the updated data
                    const form = document.createElement('form');
                    form.method = 'post';
                    form.action = 'UpdateInfoServlet';
                    const hiddenField = document.createElement('input');
                    hiddenField.type = 'hidden';
                    hiddenField.name = field;
                    hiddenField.value = value;
                    form.appendChild(hiddenField);
                    document.body.appendChild(form);
                    form.submit();
                });
            });
    
            cancelIcons.forEach(icon => {
                icon.addEventListener('click', function() {
                    const field = icon.getAttribute('data-field');
                    const input = document.getElementById(field);
                    input.setAttribute('readonly', true);
                    input.value = input.defaultValue;
                    icon.classList.add('hidden');
                    document.querySelector(`.check-icon[data-field="${field}"]`).classList.add('hidden');
                    document.querySelector(`.edit-icon[data-field="${field}"]`).classList.remove('hidden');
                    document.querySelector(`.delete-icon[data-field="${field}"]`).classList.remove('hidden');
                });
            });
        });
    </script>
</body>
</html>