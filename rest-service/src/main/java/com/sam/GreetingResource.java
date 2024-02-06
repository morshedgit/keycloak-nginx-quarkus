package com.sam;

import org.eclipse.microprofile.rest.client.inject.RestClient;

import com.sam.api.HttpClient;

import io.quarkus.security.Authenticated;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

@Path("/hello")
public class GreetingResource {

    @RestClient
    HttpClient httpClient;

    @GET
    @Authenticated
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        // return httpClient.getResponse();
        return "Hello from RESTEasy Reactive";
    }
}
