<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link href="assets/tailwind-output.css" rel="stylesheet">
    <title>Family Background</title>
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
        .input-container input, .input-container-2 {
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
            display: none !important;
        }
        .readonly-input {
            border: none !important; 
            background-color: white !important;
        }
    </style>
</head>
<body>
    <header>
        <%@ include file="dashboard-header.jsp" %>
    </header>
    <div class="m-4">
        <div id="main" class="m-10">
            <div class="section-header text-center my-8 font-[Inter] text-4xl">FAMILY BACKGROUND</div>    
            <%
                Map<String, String> data = (Map<String, String>) request.getAttribute("data");
                if (data != null) {
                    Map<String, String> respondent = data;
            %>
            <div class="flex justify-end p-4">
                <button id="editButton" class="bg-blue-500 text-white px-4 py-2 rounded">Edit</button>
                <button id="deleteButton" class="bg-gray-500 text-white px-4 py-2 rounded">Delete</button>
                <button id="discardButton" class="bg-gray-500 text-white px-4 py-2 rounded hidden">Discard Changes</button>
                <button id="updateButton" class="bg-blue-500 text-white px-4 py-2 rounded hidden">Update</button>
            </div>
            <div id="family_info" class="grid grid-cols-6 gap-x-8 gap-y-2 font-[Inter] text-xl">
                <label for="spouse_name" class="label-text flex justify-between items-center"><div class="flex">Spouse's Name</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" class="readonly-input" id="spouse_name" name="spouse_name" value="<%= respondent.get("spouse_lname") + ", " + respondent.get("spouse_fname") + " " + respondent.get("spouse_mname") + " " + (respondent.get("spouse_extname") != null ? respondent.get("spouse_extname") : " ") %>" readonly>
                </div>
                <div id="spouse_name-edit" class="grid grid-cols-3 gap-y-2 gap-x-8 hidden col-span-6">
                    <label for="spouse_lname" class="flex justify-between items-center"><div class="flex">Last Name</div><div class="flex">:</div></label>
                    <input type="text" id="spouse_lname" class="input-container-2 col-span-2" name="spouse_lname" value="<%= respondent.get("spouse_lname") %>">
                    <label for="spouse_fname" class="flex justify-between items-center"><div class="flex">First Name</div><div class="flex">:</div></label>
                    <input type="text" id="spouse_fname" class="input-container-2 col-span-2" name="spouse_fname" value="<%= respondent.get("spouse_fname") %>">
                    <label for="spouse_mname" class="flex justify-between items-center"><div class="flex">Middle Name</div><div class="flex">:</div></label>
                    <input type="text" id="spouse_mname" class="input-container-2 col-span-2" name="spouse_mname" value="<%= respondent.get("spouse_mname") %>">
                </div>
                <label for="spouse_occupation" class="label-text flex justify-between items-center"><div class="flex">Spouse's Occupation</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" class="readonly-input" id="spouse_occupation" name="spouse_occupation" value="<%= respondent.get("spouse_occupation") %>" readonly>
                </div>
                <div id="spouse_occupation-edit" class="input-container col-span-2 hidden">
                    <input type="text" id="spouse_occupation_edit" name="spouse_occupation_edit" value="<%= respondent.get("spouse_occupation") %>">
                </div>
                <label for="spouse_employer" class="label-text flex justify-between items-center"><div class="flex">Spouse's Employer</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" class="readonly-input" id="spouse_employer" name="spouse_employer" value="<%= respondent.get("spouse_employer") %>" readonly>
                </div>
                <div id="spouse_employer-edit" class="input-container col-span-2 hidden">
                    <input type="text" id="spouse_employer_edit" name="spouse_employer_edit" value="<%= respondent.get("spouse_employer") %>">
                </div>
                <label for="spouse_employer_address" class="label-text flex justify-between items-center"><div class="flex">Spouse's Employer Address</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" class="readonly-input" id="spouse_employer_address" name="spouse_employer_address" value="<%= respondent.get("spouse_employer_address") %>" readonly>
                </div>
                <div id="spouse_employer_address-edit" class="input-container col-span-2 hidden">
                    <input type="text" id="spouse_employer_address_edit" name="spouse_employer_address_edit" value="<%= respondent.get("spouse_employer_address") %>">
                </div>
                <label for="father_name" class="label-text flex justify-between items-center"><div class="flex">Father's Name</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" class="readonly-input" id="father_name" name="father_name" value="<%= respondent.get("father_name") %>" readonly>
                </div>
                <div id="father_name-edit" class="grid grid-cols-3 gap-y-2 gap-x-8 hidden col-span-6">
                    <label for="father_lname" class="flex justify-between items-center"><div class="flex">Last Name</div><div class="flex">:</div></label>
                    <input type="text" id="father_lname" class="input-container-2 col-span-2" name="father_lname" value="<%= respondent.get("father_lname") %>">
                    <label for="father_fname" class="flex justify-between items-center"><div class="flex">First Name</div><div class="flex">:</div></label>
                    <input type="text" id="father_fname" class="input-container-2 col-span-2" name="father_fname" value="<%= respondent.get("father_fname") %>">
                    <label for="father_mname" class="flex justify-between items-center"><div class="flex">Middle Name</div><div class="flex">:</div></label>
                    <input type="text" id="father_mname" class="input-container-2 col-span-2" name="father_mname" value="<%= respondent.get("father_mname") %>">
                </div>
                <label for="mother_name" class="label-text flex justify-between items-center"><div class="flex">Mother's Name</div><div class="flex">:</div></label>
                <div class="input-container col-span-2">
                    <input type="text" class="readonly-input" id="mother_name" name="mother_name" value="<%= respondent.get("mother_name") %>" readonly>
                </div>
                <div id="mother_name-edit" class="grid grid-cols-3 gap-y-2 gap-x-8 hidden col-span-6">
                    <label for="mother_lname" class="flex justify-between items-center"><div class="flex">Last Name</div><div class="flex">:</div></label>
                    <input type="text" id="mother_lname" class="input-container-2 col-span-2" name="mother_lname" value="<%= respondent.get("mother_lname") %>">
                    <label for="mother_fname" class="flex justify-between items-center"><div class="flex">First Name</div><div class="flex">:</div></label>
                    <input type="text" id="mother_fname" class="input-container-2 col-span-2" name="mother_fname" value="<%= respondent.get("mother_fname") %>">
                    <label for="mother_mname" class="flex justify-between items-center"><div class="flex">Middle Name</div><div class="flex">:</div></label>
                    <input type="text" id="mother_mname" class="input-container-2 col-span-2" name="mother_mname" value="<%= respondent.get("mother_mname") %>">
                </div>
            </div>
            <div class="mt-4">
                <h2>Children</h2>
                <div class="grid grid-cols-2 gap-4">
                    <%
                        List<Map<String, String>> dataChildren = (List<Map<String, String>>) request.getAttribute("data_children");
                        if (dataChildren != null && !dataChildren.isEmpty()) {
                            for (Map<String, String> child : dataChildren) {
                    %>
                                <div class="input-container">
                                    <label for="child_fullname_<%= child.get("child_id") %>">Child Name:</label>
                                    <input type="text" id="child_fullname_<%= child.get("child_id") %>" name="child_fullname_<%= child.get("child_id") %>" value="<%= child.get("child_fullname") %>" readonly>
                                    <span class="icon edit-icon" data-field="child_fullname_<%= child.get("child_id") %>">&#9998;</span>
                                    <span class="icon delete-icon" data-field="child_fullname_<%= child.get("child_id") %>">&#128465;</span>
                                    <span class="icon check-icon hidden" data-field="child_fullname_<%= child.get("child_id") %>">&#10003;</span>
                                    <span class="icon cancel-icon hidden" data-field="child_fullname_<%= child.get("child_id") %>">&#10060;</span>
                                </div>
                                <div class="input-container">
                                    <label for="child_dob_<%= child.get("child_id") %>">Child Date of Birth:</label>
                                    <input type="text" id="child_dob_<%= child.get("child_id") %>" name="child_dob_<%= child.get("child_id") %>" value="<%= child.get("child_dob") %>" readonly>
                                    <span class="icon edit-icon" data-field="child_dob_<%= child.get("child_id") %>">&#9998;</span>
                                    <span class="icon delete-icon" data-field="child_dob_<%= child.get("child_id") %>">&#128465;</span>
                                    <span class="icon check-icon hidden" data-field="child_dob_<%= child.get("child_id") %>">&#10003;</span>
                                    <span class="icon cancel-icon hidden" data-field="child_dob_<%= child.get("child_id") %>">&#10060;</span>
                                </div>
                    <%
                            }
                        } else {
                    %>
                            <div>No children data available</div>
                    <%
                        }
                    %>
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
            const editButton = document.getElementById('editButton');
            const discardButton = document.getElementById('discardButton');
            const deleteButton = document.getElementById('deleteButton');
            const updateButton = document.getElementById('updateButton');
            const inputs = document.querySelectorAll('.readonly-input');
            const spouseName = document.getElementById('spouse_name');
            const spouseNameEdit = document.getElementById('spouse_name-edit');
            const fatherName = document.getElementById('father_name');
            const fatherNameEdit = document.getElementById('father_name-edit');
            const motherName = document.getElementById('mother_name');
            const motherNameEdit = document.getElementById('mother_name-edit');
            const children = document.getElementById('children');
            const childrenEdit = document.getElementById('children-edit');
            const labelText = document.getElementsByClassName('label-text');
    
            editButton.addEventListener('click', function() {
                inputs.forEach(input => {
                    input.removeAttribute('readonly');
                    input.classList.remove('readonly-input');
                    input.classList.add('editable-input');
                });
                spouseName.classList.add('hidden');
                spouseNameEdit.classList.remove('hidden');
                fatherName.classList.add('hidden');
                fatherNameEdit.classList.remove('hidden');
                motherName.classList.add('hidden');
                motherNameEdit.classList.remove('hidden');
                children.classList.add('hidden');
                childrenEdit.classList.remove('hidden');
                updateButton.classList.remove('hidden');
                deleteButton.classList.add('hidden');
                discardButton.classList.rem ove('hidden');
                editButton.classList.add('hidden');
                Array.from(labelText).forEach(label => {
                    label.classList.add('hidden');
                });
            });
    
            discardButton.addEventListener('click', function() {
                inputs.forEach(input => {
                    input.setAttribute('readonly', true);
                    input.classList.add('readonly-input');
                    input.classList.remove('editable-input');
                });
                spouseName.classList.remove('hidden');
                spouseNameEdit.classList.add('hidden');
                fatherName.classList.remove('hidden');
                fatherNameEdit.classList.add('hidden');
                motherName.classList.remove('hidden');
                motherNameEdit.classList.add('hidden');
                children.classList.remove('hidden');
                childrenEdit.classList.add('hidden');
                editButton.classList.remove('hidden');
                deleteButton.classList.remove('hidden');
                discardButton.classList.add('hidden');
                updateButton.classList.add('hidden');
                Array.from(labelText).forEach(label => {
                    label.classList.remove('hidden');
                });
                // Optionally, reset the input values to their original state if needed
                // document.getElementById('yourFormId').reset();
            });
    
            deleteButton.addEventListener('click', function() {
                // Add your delete logic here
            });
    
            // Handle edit, delete, update, and discard for children
            document.querySelectorAll('.edit-icon').forEach(icon => {
                icon.addEventListener('click', function() {
                    const field = this.getAttribute('data-field');
                    document.getElementById(field).removeAttribute('readonly');
                    document.getElementById(field).classList.remove('readonly-input');
                    document.getElementById(field).classList.add('editable-input');
                    this.classList.add('hidden');
                    document.querySelector(`.delete-icon[data-field="${field}"]`).classList.add('hidden');
                    document.querySelector(`.check-icon[data-field="${field}"]`).classList.remove('hidden');
                    document.querySelector(`.cancel-icon[data-field="${field}"]`).classList.remove('hidden');
                });
            });
    
            document.querySelectorAll('.cancel-icon').forEach(icon => {
                icon.addEventListener('click', function() {
                    const field = this.getAttribute('data-field');
                    document.getElementById(field).setAttribute('readonly', true);
                    document.getElementById(field).classList.add('readonly-input');
                    document.getElementById(field).classList.remove('editable-input');
                    this.classList.add('hidden');
                    document.querySelector(`.check-icon[data-field="${field}"]`).classList.add('hidden');
                    document.querySelector(`.edit-icon[data-field="${field}"]`).classList.remove('hidden');
                    document.querySelector(`.delete-icon[data-field="${field}"]`).classList.remove('hidden');
                    // Optionally, reset the input values to their original state if needed
                    // document.getElementById('yourFormId').reset();
                });
            });
    
            document.querySelectorAll('.check-icon').forEach(icon => {
                icon.addEventListener('click', function() {
                    const field = this.getAttribute('data-field');
                    document.getElementById(field).setAttribute('readonly', true);
                    document.getElementById(field).classList.add('readonly-input');
                    document.getElementById(field).classList.remove('editable-input');
                    this.classList.add('hidden');
                    document.querySelector(`.cancel-icon[data-field="${field}"]`).classList.add('hidden');
                    document.querySelector(`.edit-icon[data-field="${field}"]`).classList.remove('hidden');
                    document.querySelector(`.delete-icon[data-field="${field}"]`).classList.remove('hidden');
                    // Add your update logic here
                });
            });
    
            document.querySelectorAll('.delete-icon').forEach(icon => {
                icon.addEventListener('click', function() {
                    const field = this.getAttribute('data-field');
                    // Add your delete logic here
                });
            });
        });
    </script>
</body>
</html>