grouperPasswordSave = new GrouperPasswordSave();
grouperPasswordSave.assignUsername("GrouperSystem").assignPassword("letmein7").assignEntityType("username");
grouperPasswordSave.assignApplication(GrouperPassword.Application.UI);
new Authentication().assignUserPassword(grouperPasswordSave);