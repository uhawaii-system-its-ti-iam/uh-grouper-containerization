package edu.hawaii.iam.grouper;

import org.pac4j.cas.client.CasClient;
import org.pac4j.cas.config.CasConfiguration;
import org.pac4j.core.client.Clients;
import org.pac4j.core.config.Config;
import org.pac4j.core.config.ConfigFactory;
import org.pac4j.core.matching.matcher.PathMatcher;

public class Pac4jConfigFactory implements ConfigFactory {
    @Override
    public Config build(Object... parameters) {
        final CasConfiguration casConfiguration = new CasConfiguration();
        casConfiguration.setLoginUrl(Pac4jConfig.retrieveConfig().propertyValueString("pac4j.cas.loginUrl"));
        final CasClient casClient = new CasClient(casConfiguration);

        String callbackUrl = Pac4jConfig.retrieveConfig().propertyValueString("pac4j.grouperContextUrl") + Pac4jConfig.retrieveConfig().propertyValueString("pac4j.callbackUrl");
        final Clients clients = new Clients(callbackUrl, casClient);

        final Config config = new Config(clients);
        /*
            /grouperExternal/public/OwaspJavaScriptServlet
            /grouperExternal/public/UiV2Public.postIndex
         */
        // config.addMatcher("excludePath", new PathMatcher().excludeRegex("^/grouperExternal/public/(OwaspJavaScriptServlet|UiV2Public\\.postIndex)$"));
        return config;
    }
}
