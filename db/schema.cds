using { managed, sap } from '@sap/cds/common';
namespace sap.capire.employeemanagement;

entity Employees : managed {
  key ID : Integer;
  name   : localized String(111);
  email  : localized String(1111);
  project : Association to Projects;
  role    : Association to Roles;
  addresses : Composition of many Addresses on addresses.employee = $self;
}

entity Addresses : managed {
  key ID : Integer;
  street  : String(255);
  city    : String(111);
  state   : String(111);
  zipCode : String(20);
  country : String(111);
  employee : Association to Employees;
}

entity Projects : managed {
  key ID : Integer;
  title  : String(111);
  startDate : Date;
  endDate   : Date;
  location  : String;
  description : String(1111);
  employees : Association to many Employees on employees.project = $self;
}

/** Hierarchically organized Code List for Roles */
entity Roles : sap.common.CodeList {
  key ID   : Integer;
  parent   : Association to Roles;
  children : Composition of many Roles on children.parent = $self;
}
