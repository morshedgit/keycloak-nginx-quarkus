# Use the Keycloak image as the builder stage to enable health, metrics, and configure the database
FROM quay.io/keycloak/keycloak:22.0.5 as builder

WORKDIR /opt/keycloak

# Add custom providers or modules here. For example, copying custom providers to the deployments directory
ADD --chown=keycloak:keycloak ./sms-authenticator/target/*.jar /opt/keycloak/providers/
# Build the Keycloak server with the custom providers
RUN /opt/keycloak/bin/kc.sh build

# Use the Keycloak base image for the final image
FROM quay.io/keycloak/keycloak:22.0.5

# Copy the built Keycloak server from the builder stage
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
# Set the entrypoint to start Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]

# Use CMD to specify default arguments
# CMD ["start", "--proxy=edge"]
