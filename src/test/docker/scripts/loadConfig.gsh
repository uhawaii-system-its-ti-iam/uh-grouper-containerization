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

def properties = new Properties().with {
    it.load(new File('c:/Users/jj-unicon/Desktop/grouper-loader.properties').newInputStream())
    it
}

println "here we go"
properties.each {
    println "${it.key}: ${it.value}"
    new edu.internet2.middleware.grouper.grouperUi.beans.config.GrouperDbConfig().configFileName('grouper-loader.properties').propertyName(it.key).value(it.value).store()
}