addSubject('jj61', 'person', 'jj61');
grouperPasswordSave = new GrouperPasswordSave();
grouperPasswordSave.assignUsername("jj61").assignPassword("letmein7").assignEntityType("username");
grouperPasswordSave.assignApplication(GrouperPassword.Application.UI);
new Authentication().assignUserPassword(grouperPasswordSave);

new edu.internet2.middleware.grouper.grouperUi.beans.config.GrouperDbConfig().configFileName("grouper.properties").propertyName("groups.wheel.use").value("true").store();
new edu.internet2.middleware.grouper.grouperUi.beans.config.GrouperDbConfig().configFileName("grouper.properties").propertyName("configuration.autocreate.system.groups").value("true").store();
new edu.internet2.middleware.grouper.grouperUi.beans.config.GrouperDbConfig().configFileName("grouper.properties").propertyName("groups.wheel.group").value("etc:sysadmingroup").store();

addGroup("etc", "sysadmingroup", "sysadmingroup");
addMember("etc:sysadmingroup", "jj61");