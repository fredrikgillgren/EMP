const cds = require('@sap/cds/lib')

module.exports = class AdminService extends cds.ApplicationService { init(){
  this.before ('NEW','Projects', genid)
  this.before ('NEW','Employees', genid)
  this.before ('NEW','Roles', genid)
  this.before ('NEW','Addresses', genid)
  this.before ('NEW','EmployeeProjects', genid)
  return super.init()
}}

/** Generate primary keys for target entity in request */
async function genid (req) {
  const {ID} = await cds.tx(req).run (SELECT.one.from(req.target).columns('max(ID) as ID'))
  req.data.ID = ID - ID % 100 + 100 + 5
}
