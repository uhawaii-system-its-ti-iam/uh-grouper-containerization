package edu.hawaii.iam.grouper;

import org.pac4j.core.authorization.authorizer.DefaultAuthorizers;
import org.pac4j.core.util.Pac4jConstants;
import org.pac4j.jee.filter.CallbackFilter;
import org.pac4j.jee.filter.SecurityFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContainerInitializer;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import java.util.Set;

public class Pac4jServletContainerInitializer implements ServletContainerInitializer {
    private static final Logger LOGGER = LoggerFactory.getLogger(Pac4jServletContainerInitializer.class);

    @Override
    public void onStartup(Set<Class<?>> c, ServletContext ctx) throws ServletException {
        if (Pac4jConfig.retrieveConfig().propertyValueBoolean("pac4j.enabled", false)) {
            LOGGER.info("initializing pac4j");

            FilterRegistration.Dynamic callbackFilter = ctx.addFilter("callbackFilter", CallbackFilter.class);
            callbackFilter.setInitParameter("defaultUrl", Pac4jConfig.retrieveConfig().propertyValueString("pac4j.defaultUrl", "/"));
            callbackFilter.setInitParameter("renewSession", "true");
            callbackFilter.addMappingForUrlPatterns(null, false, Pac4jConfig.retrieveConfig().propertyValueString("pac4j.callbackUrl", "/grouper/callback"));

            FilterRegistration.Dynamic securityFilter = ctx.addFilter("securityFilter", SecurityFilter.class);
            securityFilter.setInitParameter("configFactory", Pac4jConfigFactory.class.getCanonicalName());
            securityFilter.setInitParameter("clients", "CasClient");
            // securityFilter.setInitParameter(Pac4jConstants.MATCHERS, String.join(Pac4jConstants.ELEMENT_SEPARATOR, DefaultMatchers.SECURITYHEADERS));
            securityFilter.setInitParameter(Pac4jConstants.AUTHORIZERS, DefaultAuthorizers.NONE);
            securityFilter.addMappingForUrlPatterns(null, false, "/*");

            LOGGER.info("finished initializing pac4j");
        }
    }
}
