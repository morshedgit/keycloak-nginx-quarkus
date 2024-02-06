docker run \
  -p 8080:8080 \
  -e KEYCLOAK_ADMIN=admin \
  -e KEYCLOAK_ADMIN_PASSWORD=admin \
  -e KC_HOSTNAME=local.guava.ccc-jaguar-nug.co \
  -e KC_HOSTNAME_ADMIN_URL=https://local.guava.ccc-jaguar-nug.co:8092 \
  -e KC_HOSTNAME_PORT="8092" \
  -e KC_HOSTNAME_DEBUG="true" \
  -e KC_HTTP_ENABLED="true" \
  -e KC_HTTPS_PORT="8433" \
  -e KC_PROXY="edge" \
#   -e KC_DB="postgres" \
#   -e KC_DB_URL="jdbc:postgresql://db:5432/keycloak" \
#   -e KC_DB_USERNAME="postgres" \
#   -e KC_DB_PASSWORD="dbpass" \
#   -e KC_LOG_LEVEL="ERROR" \
#   -e KC_LOG="file" \
#   -e KC_LOG_FILE="/logs/keycloak.log" \
  --net keycloak_app-network \
  quay.io/keycloak/keycloak start > keycloak-logs.txt 2>&1

  docker run \
  -p 8080:8080 \
  -e KEYCLOAK_ADMIN=admin \
  -e KEYCLOAK_ADMIN_PASSWORD=admin \
  -e KC_HOSTNAME=local.guava.ccc-jaguar-nug.co \
  -e KC_HOSTNAME_ADMIN_URL=https://local.guava.ccc-jaguar-nug.co:8092 \
  -e KC_HOSTNAME_PORT="8092" \
  -e KC_HOSTNAME_DEBUG="true" \
  -e KC_HTTP_ENABLED="true" \
  -e KC_HTTPS_PORT="8433" \
  -e KC_PROXY="edge" \
  --net keycloak_app-network \
  quay.io/keycloak/keycloak start --log-level="info" --db postgres --db-url jdbc:postgresql://db:5432/keycloak --db-username postgres --db-password dbpass  > keycloak-logs.txt 2>&1

  

  docker run \
  -p 8080:8080 \
  -e KEYCLOAK_ADMIN=admin \
  -e KEYCLOAK_ADMIN_PASSWORD=admin \
  -e KC_HOSTNAME=local.guava.ccc-jaguar-nug.co \
  -e KC_HOSTNAME_ADMIN_URL=https://local.guava.ccc-jaguar-nug.co:8092 \
  -e KC_HOSTNAME_PORT="8092" \
  -e KC_HOSTNAME_DEBUG="true" \
  -e KC_HTTP_ENABLED="true" \
  -e KC_HTTPS_PORT="8433" \
  -e KC_PROXY="edge" \
  --net keycloak_app-network \
  quay.io/keycloak/keycloak start > keycloak-logs.txt 2>&1


  docker network create my-network

  docker run -d -p 5432:5432 --name my-postgres --net my-network \
    -e POSTGRES_PASSWORD=mypass \
    -e POSTGRES_DB=keycloak \
    postgres

  docker run -p 8080:8080 --name my-keycloak --net my-network \
    -e KEYCLOAK_ADMIN=admin \
    -e KEYCLOAK_ADMIN_PASSWORD=admin \
    -e KC_DB=postgres \
    -e KC_DB_URL=jdbc:postgresql://my-postgres:5432/keycloak \
    -e KC_DB_USERNAME=postgres \
    -e KC_DB_PASSWORD=mypass \
    quay.io/keycloak/keycloak:22.0.5 start-dev

