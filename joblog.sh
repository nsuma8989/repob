#!/bin/bash
sudo curl -H "Authorization: Bearer $TOKEN" "https://api.buildkite.com/v2/organizations/sumatestorg/pipelines/artifact_test/builds/$BUILDKITE_BUILD_NUMBER/jobs/$BUILDKITE_JOB_ID/log"
