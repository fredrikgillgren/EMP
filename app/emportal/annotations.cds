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
      {$Type: 'UI.ReferenceFacet', Label: '{i18n>Address}', Target: 'addresses/@UI.LineItem'},
      {$Type: 'UI.ReferenceFacet', Label: '{i18n>Details}', Target: '@UI.FieldGroup#Details'},
      {$Type: 'UI.ReferenceFacet', Label: '{i18n>Admin}', Target: '@UI.FieldGroup#Admin'},
    ],
    FieldGroup#General: {
      Data: [
        {Value: name},
        {Value: email},
      ]
    },
    FieldGroup#Details: {
      Data: [
        {Value: role.name, Label: '{i18n>Roles}'}, // Add roles here
        {Value: project.title, Label: '{i18n>Projects}'}, // Add projects here
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
annotate AdminService.Employees with @odata.draft.enabled;


// Workaround for Fiori popup for asking user to enter a new UUID on Create
annotate AdminService.Employees with { ID @Core.Computed; }