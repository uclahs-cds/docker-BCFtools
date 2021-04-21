FROM blcdsdockerregistry/bl-base:1.0.0 AS builder

# Use conda to install tools and dependencies into /usr/local
ENV BCFTOOLS_VERSION=1.12
RUN conda create -qy -p /usr/local \
    -c bioconda \
    -c conda-forge \
    bcftools==${BCFTOOLS_VERSION}

# Deploy the target tools into a base image
FROM ubuntu:20.04
COPY --from=builder /usr/local /usr/local

LABEL maintainer="Tim Sanders <tsanders@ucla.edu>"