using { managed, sap } from '@sap/cds/common';
namespace sap.capire.employeemanagement;

entity Employees : managed {
  key ID : Integer;
  name   : localized String(111);
  email  : localized String(1111);
  designation : localized String(111);
  project : Association to many EmployeeProjects on project.employeeID = $self.ID;
  role    : Association to Roles;
  addresses : Association to one Addresses on addresses.employee = $self;
}

entity Addresses : managed {
  key ID : Integer;
  street  : String(255);
  city    : String(111);
  state   : String(111);
  country : String(111);
  employee : Association to one Employees;
}

entity Projects : managed {
  key ID : Integer;
  title  : String(111);
  startDate : Date;
  endDate   : Date;
  location  : String;
  description : String(1111);
  employee : Association to many EmployeeProjects on employee.projectID = $self.ID;
}

entity EmployeeProjects : managed {
  key ID : Integer;
  employeeID : Integer;
  projectID  : Integer;
  roleID     : Integer;
  employee : Association to Employees on employee.ID = $self.employeeID;
  project  : Association to Projects on project.ID = $self.projectID;
  role     : Association to Roles on role.ID = $self.roleID;
}

/** Hierarchically organized Code List for Roles */
entity Roles : sap.common.CodeList {
  key ID   : Integer;
  parent   : Association to Roles;
  children : Composition of many Roles on children.parent = $self;
}
