# Docker stacks

Portainer-managed Docker Compose stack for standalone Docker hosts.

## Layout

A single `docker-stacks/docker-compose.yml` uses Docker Compose `include` to pull in:

| Include | Purpose | Endpoint |
|---|---|---|
| `core` | Docktail (Tailscale service proxy) | `docker-svc-0` |
| `monitoring` | Uptime-Kuma (Beszel later) | `docker-svc-0` |
| `networking` | Technitium DNS | mini PC |
| `docker-apps` | Misc apps (`whoami`) | `docker-svc-0` |

All app stacks attach to the `homelab_proxy` bridge network (Ansible ensures it exists before the stack deploys).

## HTTPS

App labels expose services via Docktail as native Tailscale Services on port 443 with automatic Tailscale HTTPS certificates, e.g.:

```yaml
labels:
  docktail.service.enable: "true"
  docktail.service.name: whoami
  docktail.service.port: "80"
  docktail.service.service-port: "443"
  docktail.service.protocol: http
```

## Deployment

Portainer GitOps pulls `docker-stacks/docker-compose.yml` from this repo. Ansible only bootstraps Docker, Tailscale, and Portainer.
