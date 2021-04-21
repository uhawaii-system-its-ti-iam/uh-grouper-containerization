def grouperSession = GrouperSession.startRootSession();
def membersToAdd = ["baron", "julio", "keithhir", "mhodges"]

addGroup("etc", "grouperAdmins", "users with superuser privileges")
membersToAdd.each {m -> 
   addMember("etc:grouperAdmins", m)
}

addGroup("etc", "uiUsers", " users allowed to log in to the UI")
membersToAdd.each {m ->
   addMember("etc:uiUsers", m)
}

addGroup("etc", "wsUsers", "users allowed to log in to the WS")

