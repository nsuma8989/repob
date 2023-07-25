cat <<EOF >> generated_pipeline.yaml
env:
 TERRITORY: $TERRITORY
 CELL: $CELL
 BACKEND_GIT_REF: $BACKEND_GIT_REF
 SEED_SNAPSHOT: ${SEED_SNAPSHOT:-""}
 ATLAS_HTTP_USERNAME_DIGEST: ${ATLAS_HTTP_USERNAME_DIGEST:-""}
 ATLAS_HTTP_PASSWORD_DIGEST: ${ATLAS_HTTP_PASSWORD_DIGEST:-""}
 MONGODB_TEST_SHELL_URL: ${MONGODB_TEST_SHELL_URL:-""}

retry: &retry
  automatic:
  - exit_status: -1  # Agent was lost
    limit: 2
  - signal_reason: agent_stop
    limit: 2
  - exit_status: 255 # Forced agent shutdown
    limit: 2
  - exit_status: 20 # ArgoCD failures
    limit: 2

steps:
  - label: "Disabling the deployment"
    command: sleep 1
    retry: *retry

  - wait

  - label: "reset showcase database"
    timeout_in_minutes: 150
    command: sleep 120
    retry: *retry

EOF

cat generated_pipeline.yaml

buildkite-agent pipeline upload generated_pipeline.yaml
