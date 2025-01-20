/*
 Common Annotations shared by all apps
*/

using { sap.capire.employeemanagement as my } from '../db/schema';

////////////////////////////////////////////////////////////////////////////
//
//	Employees Lists
//
annotate my.Employees with @(
  Common.SemanticKey : [ID],
  UI                 : {
    Identification  : [{ Value: name }],
    SelectionFields : [
      ID,
      name,
      email,
      addresses
    ],
    LineItem        : [
      { Value: ID, Label: '{i18n>EmployeeID}' },
      { Value: name, Label: '{i18n>Name}' },
      { Value: email, Label: '{i18n>Email}' },
      { Value: addresses.street, Label: '{i18n>Street}' },
      { Value: addresses.city, Label: '{i18n>City}' }
    ]
  }
) {
  ID @Common: {
    SemanticObject : 'Employees',
    Text: name,
    TextArrangement : #TextOnly
  };
  addresses @ValueList.entity : 'Addresses';
};

////////////////////////////////////////////////////////////////////////////
//
//	Employees Details
//
annotate my.Employees with @(UI : {HeaderInfo : {
  TypeName       : '{i18n>Employee}',
  TypeNamePlural : '{i18n>Employees}',
  Title          : { Value: name },
  Description    : { Value: email }
}, });

////////////////////////////////////////////////////////////////////////////
//
//	Employees Elements
//
annotate my.Employees with {
  ID             @title: '{i18n>ID}';
  name           @title: '{i18n>Name}';
  email          @title: '{i18n>Email}';
  addresses      @title: '{i18n>Addresses}' @Common: { Text: addresses.city, TextArrangement: #TextOnly };
  project        @title: '{i18n>Project}' @Common: { Text: project.title, TextArrangement: #TextOnly };
  role           @title: '{i18n>Role}'   @Common: { Text: role.name, TextArrangement: #TextOnly };
  profilePicture @title: '{i18n>ProfilePicture}' @UI.LineItem: { Value: profilePicture, Label: '{i18n>ProfilePicture}' };
}

////////////////////////////////////////////////////////////////////////////
//
//	Projects Lists
//
annotate my.Projects with @(
  Common.SemanticKey : [ID],
  UI                 : {
    Identification  : [{ Value: title }],
    SelectionFields : [
      title,
      startDate,
      endDate,
      location
    ],
    LineItem        : [
      { Value: ID, Label: '{i18n>ProjectID}' },
      { Value: title, Label: '{i18n>Title}' },
      { Value: startDate, Label: '{i18n>StartDate}' },
      { Value: endDate, Label: '{i18n>EndDate}' },
      { Value: location, Label: '{i18n>Location}' }
    ]
  }
) {
  ID @Common: {
    SemanticObject : 'Projects',
    Text: title,
    TextArrangement : #TextOnly
  };
};

////////////////////////////////////////////////////////////////////////////
//
//	Projects Details
//
annotate my.Projects with @(UI : {HeaderInfo : {
  TypeName       : '{i18n>Project}',
  TypeNamePlural : '{i18n>Projects}',
  Title          : { Value: title },
  Description    : { Value: location }
}, });

////////////////////////////////////////////////////////////////////////////
//
//	Projects Elements
//
annotate my.Projects with {
  ID          @title: '{i18n>ID}';
  title       @title: '{i18n>Title}';
  startDate   @title: '{i18n>StartDate}';
  endDate     @title: '{i18n>EndDate}';
  location    @title: '{i18n>Location}';
  description @UI.MultiLineText @title: '{i18n>Description}';
}

////////////////////////////////////////////////////////////////////////////
//
//	Addresses Lists
//
annotate my.Addresses with @(
  Common.SemanticKey : [ID],
  UI                 : {
    SelectionFields : [street, city, state, country],
    LineItem        : [
      { Value: ID, Label: '{i18n>AddressID}' },
      { Value: street, Label: '{i18n>Street}' },
      { Value: city, Label: '{i18n>City}' },
      { Value: state, Label: '{i18n>State}' },
      { Value: country, Label: '{i18n>Country}' }
    ]
  }
);

////////////////////////////////////////////////////////////////////////////
//
//	Addresses Details
//
annotate my.Addresses with @(UI : {HeaderInfo : {
  TypeName       : '{i18n>Address}',
  TypeNamePlural : '{i18n>Addresses}',
  Title          : { Value: street },
  Description    : { Value: city }
}, });

////////////////////////////////////////////////////////////////////////////
//
//	Addresses Elements
//
annotate my.Addresses with {
  ID       @title: '{i18n>ID}';
  street   @title: '{i18n>Street}';
  city     @title: '{i18n>City}';
  state    @title: '{i18n>State}';
  zipCode  @title: '{i18n>ZipCode}';
  country  @title: '{i18n>Country}';
}

////////////////////////////////////////////////////////////////////////////
//
//	Roles Lists
//
annotate my.Roles with @(
  Common.SemanticKey : [ID],
  UI                 : {
    SelectionFields : [name],
    LineItem        : [
      { Value: ID, Label: '{i18n>RoleID}' },
      { Value: name, Label: '{i18n>RoleName}' },
      { Value: parent.name, Label: '{i18n>ParentRole}' }
    ]
  }
);

////////////////////////////////////////////////////////////////////////////
//
//	Roles Details
//
annotate my.Roles with @(UI : {HeaderInfo : {
  TypeName       : '{i18n>Role}',
  TypeNamePlural : '{i18n>Roles}',
  Title          : { Value: name },
  Description    : { Value: ID }
}, });

////////////////////////////////////////////////////////////////////////////
//
//	Roles Elements
//
annotate my.Roles with {
  ID     @title: '{i18n>ID}';
  name   @title: '{i18n>RoleName}';
  parent @title: '{i18n>ParentRole}' @Common: { Text: parent.name };
}
