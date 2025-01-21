using { sap.capire.employeemanagement as my } from '../db/schema';
service AdminService @(requires:'any') {
  entity Employees as projection on my.Employees;
  entity Projects as projection on my.Projects;
  entity Roles as projection on my.Roles;
  entity Addresses as projection on my.Addresses;
  entity EmployeeProjects as projection on my.EmployeeProjects;
}
