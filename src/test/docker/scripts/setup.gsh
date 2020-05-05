addSubject('jj61', 'person', 'jj61');

/*
grouperPasswordSave = new GrouperPasswordSave();
grouperPasswordSave.assignUsername("jj61").assignPassword("letmein7").assignEntityType("username");
grouperPasswordSave.assignApplication(GrouperPassword.Application.UI);
new Authentication().assignUserPassword(grouperPasswordSave);
 */

class Setting {
    String file
    String name
    String value

    public Setting(String file, String name, String value) {
        this.file = file
        this.name = name
        this.value = value
    }
}

[
        new Setting('grouper.properties', 'groups.wheel.use', 'true'),
        new Setting('grouper.properties', 'configuration.autocreate.system.groups', 'true'),
        new Setting('grouper.properties', 'groups.wheel.group', 'etc:sysadmingroup'),
        // new Setting('pac4j.properties', 'pac4j.enabled', 'true'),
        // new Setting('pac4j.properties', 'pac4j.cas.loginUrl', 'https://cas-test.its.hawaii.edu/cas/login')
].each {
    new edu.internet2.middleware.grouper.grouperUi.beans.config.GrouperDbConfig().configFileName(it.file).propertyName(it.name).value(it.value).store();
}

addGroup("etc", "sysadmingroup", "sysadmingroup");
addMember("etc:sysadmingroup", "jj61");