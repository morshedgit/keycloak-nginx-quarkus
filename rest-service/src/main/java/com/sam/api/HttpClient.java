package com.sam.api;

import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;

@Path("/")
// @RegisterRestClient(baseUri = "https://local.guava.ccc-jaguar-nug.co:8092/realms/my-idp")
@RegisterRestClient(baseUri = "http://node-service:3000")
public interface HttpClient {
    
    @GET
    String getResponse();
}
