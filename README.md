# Briefer Cloud Deployment for Railway

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/zmXHYJ?referralCode=HxrUPo)

This repository contains the configuration and Dockerfiles for deploying Briefer Cloud into Railway.

## Overview

- **Purpose:** Deploy Briefer Cloud into Railway.
- **Components:**
  - **nginx Service:** Customized using a provided `nginx.conf` file in the `nginx.Dockerfile`.
  - **briefer Web Service:** Configured to enable IPv6 connections, as Railway resolves internal addresses using IPv6.

## Key Files

- **nginx.conf:** Custom nginx configuration file used by the nginx service.
- **nginx.Dockerfile:** Dockerfile for the nginx service, which copies the `nginx.conf` file.
- **web.Dockerfile:** Dockerfile for the briefer web service, which updates `start.sh` to support IPv6 connections.
- **docker-entrypoint.sh:** Script used in the nginx service to substitute environment variables and start nginx.

## How It Works

1. **nginx Service:**
   - The `nginx.Dockerfile` starts from the nginx base image and copies the custom `nginx.conf` file.
   - The `docker-entrypoint.sh` script substitutes environment variables (e.g., `WEB_URL`, `API_URL`) into the nginx configuration at runtime.

2. **briefer Web Service:**
   - The `web.Dockerfile` starts from `briefercloud/briefer-web` and updates the `start.sh` script to use `HOSTNAME=::` for IPv6 support.
   - This ensures that the Next.js app listens on IPv6, allowing connections from Railway's internal IPv6 addresses.

## Deployment

To deploy Briefer Cloud into Railway, build and push the Docker images using the provided Dockerfiles. Ensure that the environment variables (e.g., `WEB_URL`, `API_URL`) are set correctly in your Railway configuration.
