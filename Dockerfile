FROM blcdsdockerregistry/bl-base:1.0.0 AS builder

# Use conda to install tools and dependencies into /usr/local
ARG BCFTOOLS_VERSION=1.15
RUN conda create -qy -p /usr/local \
    -c bioconda \
    -c conda-forge \
    bcftools==${BCFTOOLS_VERSION}

# Deploy the target tools into a base image
FROM ubuntu:20.04
COPY --from=builder /usr/local /usr/local

LABEL maintainer="Tim Sanders <tsanders@mednet.ucla.edu>"
