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
      designation
    ],
    LineItem        : [
      { Value: name, Label: '{i18n>Name}' },
      { Value: email, Label: '{i18n>Email}' },
      { Value: designation, Label: '{i18n>Designation}' }
    ]
  }
) {
  ID @Common: {
    SemanticObject : 'Employees',
    Text: name,
    TextArrangement : #TextOnly
  };
  project @ValueList.entity : 'Projects'; 
};

////////////////////////////////////////////////////////////////////////////
//
//	Employees Details
//
annotate my.Employees with @(UI : {HeaderInfo : {
  TypeName       : '{i18n>Employee}',
  TypeNamePlural : '{i18n>Employees}',
  Title          : { Value: name, Label: '{i18n>Name}' },
  Description    : { Value: designation , Label: '{i18n>Designation}' }
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
}

////////////////////////////////////////////////////////////////////////////
//
//	Projects Lists
//
annotate my.Projects with @(
  Common.SemanticKey : [ID],
  UI                 : {
    Identification  : [{ Value: title }],
    SelectionFields : [title],
    LineItem        : [
      { Value: ID, Label: '{i18n>ProjectID}' },
      { Value: title, Label: '{i18n>Title}' },
      { Value: startDate, Label: '{i18n>StartDate}' },
      { Value: endDate, Label: '{i18n>EndDate}' },
      { Value: location, Label: '{i18n>Location}' },
      { Value: description, Label: '{i18n>Description}' }
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
  Description    : { Value: desciption }
}, 
  Facets : [{
    $Type: 'UI.ReferenceFacet',  Target: 'employee/@UI.LineItem'
  },],
});

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
    Identification  : [{ Value: ID }],
    SelectionFields : [ID],
    LineItem        : [
      { Value: street, Label: '{i18n>Street}' },
      { Value: city, Label: '{i18n>City}' },
      { Value: state, Label: '{i18n>State}' },
      { Value: country, Label: '{i18n>Country}' }
    ]
  }
) {
  ID @Common: {
    SemanticObject : 'Addresses',
    Text: street,
    TextArrangement : #TextOnly
  };
};

////////////////////////////////////////////////////////////////////////////
//
//	Addresses Details
//
annotate my.Addresses with @(UI : {HeaderInfo : {
  TypeName       : '{i18n>Address}',
  TypeNamePlural : '{i18n>Addresses}',
  Title          : { Value: street },
  Description    : { Value: city }
},
  Facets : [{
    $Type: 'UI.ReferenceFacet',  Target: 'employee/@UI.LineItem'
  },], 
});

////////////////////////////////////////////////////////////////////////////
//
//	Addresses Elements
//
annotate my.Addresses with {
  ID       @title: '{i18n>ID}';
  street   @title: '{i18n>Street}';
  city     @title: '{i18n>City}';
  state    @title: '{i18n>State}';
  country  @title: '{i18n>Country}';
  employee @title: '{i18n>Employee}' @Common: { Text: employee.name, TextArrangement: #TextOnly };
}

////////////////////////////////////////////////////////////////////////////
//
//	Roles Lists
//
annotate my.Roles with @(
  Common.SemanticKey : [name],
  UI                 : {
    SelectionFields : [name],
    LineItem        : [
      { Value: name, Label: '{i18n>Role Name}' },
      { Value: parent.name, Label: '{i18n>Parent Role}' }
    ]
  }
);

////////////////////////////////////////////////////////////////////////////
//
//	Roles Details
//
annotate my.Roles with @(UI : {
  Identification : [{ Value: name }],
  HeaderInfo     : {
    TypeName       : '{i18n>Role}',
    TypeNamePlural : '{i18n>Roles}',
    Title          : { Value: name },
    Description    : { Value: ID }
  },
  Facets         : [{
    $Type: 'UI.ReferenceFacet', Label: '{i18n>SubRoles}', Target: 'children/@UI.LineItem'
  },],
});


////////////////////////////////////////////////////////////////////////////
//
//	Roles Elements
//
annotate my.Roles with {
  ID     @title: '{i18n>ID}';
  name   @title: '{i18n>RoleName}';
}

////////////////////////////////////////////////////////////////////////////
//
//	EmployeeProjects Lists
//
annotate my.EmployeeProjects with @(
  Common.SemanticKey : [ID],
  UI                 : {
    Identification  : [{ Value: ID }],
    SelectionFields : [ID],
    LineItem        : [
      { Value: employee.name, Label: '{i18n>Employee}' },
      { Value: role.name, Label: '{i18n>Role}' },
      { Value: project.title, Label: '{i18n>Project}' },
      { Value: project.startDate, Label: '{i18n>StartDate}' },
      { Value: project.endDate, Label: '{i18n>EndDate}' }
    ]
  }
) {
  ID @Common: {
    SemanticObject : 'EmployeeProjects',
    Text: ID,
    TextArrangement : #TextOnly
  };
};

////////////////////////////////////////////////////////////////////////////
//
//	EmployeeProjects Details
//
annotate my.EmployeeProjects with @(UI : {HeaderInfo : {
  TypeName       : '{i18n>EmployeeProject}',
  TypeNamePlural : '{i18n>EmployeeProjects}',
  Title          : { Value: ID },
  Description    : { Value: project.title }
},
  Facets : [{
    $Type: 'UI.ReferenceFacet',  Target: 'employee/@UI.LineItem'
    },],
});

////////////////////////////////////////////////////////////////////////////
//
//	EmployeeProjects Elements
//
annotate my.EmployeeProjects with {
  ID        @title: '{i18n>ID}';
  employee  @title: '{i18n>Employee}' @Common: { Text: employee.name, TextArrangement: #TextOnly };
  project   @title: '{i18n>Project}'  @Common: { Text: project.title, TextArrangement: #TextOnly };
}

