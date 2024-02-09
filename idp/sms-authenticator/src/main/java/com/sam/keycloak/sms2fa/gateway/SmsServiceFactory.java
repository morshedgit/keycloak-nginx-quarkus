package com.sam.keycloak.sms2fa.gateway;



import java.util.Map;

import org.jboss.logging.Logger;

import com.sam.keycloak.sms2fa.SmsConstants;

public class SmsServiceFactory {
    private static final Logger logger = Logger.getLogger(SmsServiceFactory.class);
	public static SmsService get(Map<String, String> config) {
		if (Boolean.parseBoolean(config.getOrDefault(SmsConstants.SIMULATION_MODE, "false"))) {
			return (phoneNumber, message) ->
				logger.warn(String.format("***** SIMULATION MODE ***** Would send SMS to %s with text: %s", phoneNumber, message));
		} else {
			return new TwilioSmsService(config);
		}
	}

}
