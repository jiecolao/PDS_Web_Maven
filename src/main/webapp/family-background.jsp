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
        <div id="main" class="m-10 mb-48">
            <div class="section-header text-center my-8 font-[Inter] text-4xl">FAMILY BACKGROUND</div>
            <form action="UpdateFamilyBackgroundServlet" method="get">
                <%
                String p_id = "", fam_bg_id="";
                Map<String, String> data = (Map<String, String>) request.getAttribute("data");
                if (data != null) {
                    Map<String, String> respondent = data;
                    p_id = respondent.get("p_id");
                    fam_bg_id = respondent.get("fam_bg_id");
                %>
                <div class="flex justify-end p-4 gap-4">
                    <button id="editButton" type="button" class="w-32 text-center bg-blue-500 text-white px-4 py-2 rounded">Edit</button>
                    <button id="deleteButton" type="button" class="w-32 text-center bg-gray-500 text-white px-4 py-2 rounded">Delete</button>
                    <button id="discardButton" type="button" class="w-32 text-center bg-gray-500 text-white px-4 py-2 rounded hidden">Discard Changes</button>
                    <button id="updateButton" type="submit" class="w-32 text-center bg-blue-500 text-white px-4 py-2 rounded hidden">Update</button>
                </div>
                <div id="family_info" class="grid grid-cols-6 gap-x-8 gap-y-2 font-[Inter] text-xl">
                    <%@ include file="family-background-spouse.jsp" %>
                    <%@ include file="family-background-parents.jsp" %>
                </div>
                <%@ include file="family-background-children.jsp" %>
                <%
                    } else {
                %>
                    <div>No data available</div>
                <%
                    }
                %>
                </div>
                <input type="hidden" name="p_id" value="<%= p_id %>">
            </form>    
        <form action="DeleteRecordServlet" method="post" id="deleteForm">
            <input type="hidden" name="p_id" value="<%= p_id %>">
        </form>
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
            const labelText = document.getElementsByClassName('label-text');
            const childName = document.getElementsByClassName('child_fullname');
            const childDob = document.getElementsByClassName('child_dob');

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
                updateButton.classList.remove('hidden');
                deleteButton.classList.add('hidden');
                discardButton.classList.remove('hidden');
                editButton.classList.add('hidden');
                Array.from(labelText).forEach(label => {
                    label.classList.add('hidden');
                });
                Array.from(childName).forEach(child => {
                    child.classList.remove('readonly-input');
                    child.classList.add('input-container-2');
                });
                Array.from(childDob).forEach(child => {
                    child.classList.remove('readonly-input');
                    child.classList.add('input-container-2');
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

            deleteButton.addEventListener('click', function() {
                document.getElementById('deleteForm').submit();
            });
        });
    </script>
</body>
</html>