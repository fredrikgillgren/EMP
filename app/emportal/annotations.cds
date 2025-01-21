using { AdminService } from '../../srv/admin-service';
using from '../commonAnnotations'; // to help UI linter get the complete annotations

////////////////////////////////////////////////////////////////////////////
//
//	Employee Object Page
//

annotate AdminService.Employees with @(
  UI: {
    Facets: [
      {$Type: 'UI.ReferenceFacet', Label: '{i18n>General}', Target: '@UI.FieldGroup#General'},
      {$Type: 'UI.ReferenceFacet', Label: '{i18n>Address}', Target: '@UI.FieldGroup#Address'},
      {$Type: 'UI.ReferenceFacet', Label: '{i18n>Project Details}', Target: 'project/@UI.LineItem'},
      {$Type: 'UI.ReferenceFacet', Label: '{i18n>Admin}', Target: '@UI.FieldGroup#Admin'},
    ],
    FieldGroup#General: {
      Data: [
        {Value: name},
        {Value: email}
      ]
    },
    FieldGroup#Address: {
      Data: [
        {Value: addresses.street},
        {Value: addresses.city},
        {Value: addresses.state},
        {Value: addresses.country}
      ]
    },
    FieldGroup#Admin: {
      Data: [
        {Value: createdBy},
        {Value: createdAt},
        {Value: modifiedBy},
        {Value: modifiedAt}
      ]
    }
  }
);

////////////////////////////////////////////////////////////
//
//  Draft for Localized Data
//

annotate sap.capire.employeemanagement.Employees with @fiori.draft.enabled;
annotate sap.capire.employeemanagement.EmployeeProjects with @fiori.draft.enabled;
annotate sap.capire.employeemanagement.Addresses with @fiori.draft.enabled; // Added draft annotation for Addresses

annotate AdminService.Employees with @odata.draft.enabled;
annotate AdminService.EmployeeProjects with @odata.draft.enabled;
annotate AdminService.Addresses with @odata.draft.enabled; // Added draft annotation for Addresses

// Workaround for Fiori popup for asking user to enter a new UUID on Create
annotate AdminService.Employees with { ID @Core.Computed; }
annotate AdminService.EmployeeProjects with { ID @Core.Computed; }
annotate AdminService.Addresses with { ID @Core.Computed; } // Added computed ID annotation for Addresses