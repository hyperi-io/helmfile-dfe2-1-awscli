# helmfile-dfe2-1-awscli

helmfile with the AWS CLI, used to deploy DFE 2.1. Legacy: kept for existing 2.1 deployments, not
for new work.

```
docker pull ghcr.io/hyperi-io/helmfile-dfe2-1-awscli:v1.2.0
```

The image is public, so no login is needed. Tags `v1.2.0`, `v1.1.6` and `latest` are the same image
(linux/amd64 and linux/arm64). The tag names come from the registry this replaced and are not the
helmfile version. The base is `ghcr.io/helmfile/helmfile-ubuntu:v1.1.5`.

## Rebuilding

Builds are manual: Actions > Build > Run workflow. Give the tags to push, which default to
`v1.2.0,v1.1.6,latest`. To move to a newer helmfile, change the `FROM` line in the Dockerfile,
including its digest, and run the workflow with a new tag.
