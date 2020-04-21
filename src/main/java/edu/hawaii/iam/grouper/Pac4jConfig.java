package edu.hawaii.iam.grouper;

import edu.internet2.middleware.grouperClient.config.GrouperHibernateConfigClient;

/**
 * Pac4j configuration information
 */
public class Pac4jConfig extends GrouperHibernateConfigClient {
    public static final String KEY = "pac4j";
    /**
     * retrieve config from file or cache
     * @return the config object
     */
    public static Pac4jConfig retrieveConfig() {
        return retrieveConfig(Pac4jConfig.class);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    protected String getHierarchyConfigKey() {
        return KEY + ".config.hierarchy";
    }

    /**
     * {@inheritDoc}
     */
    @Override
    protected String getMainConfigClasspath() {
        return KEY + ".properties";
    }

    /**
     * {@inheritDoc}
     */
    @Override
    protected String getMainExampleConfigClasspath() {
        return KEY + ".base.properties";
    }

    /**
     * {@inheritDoc}
     */
    @Override
    protected String getSecondsToCheckConfigKey() {
        return KEY + ".config.secondsBetweenUpdateChecks";
    }
}
