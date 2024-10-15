# Use a specific version of the Postgres image
FROM postgres:15.8

# Define build arguments and set labels
ARG SOURCE
ARG COMMIT_HASH
ARG COMMIT_ID
ARG BUILD_TIME
LABEL source=${SOURCE}
LABEL commit_hash=${COMMIT_HASH}
LABEL commit_id=${COMMIT_ID}
LABEL build_time=${BUILD_TIME}

# Install required packages and clean up to reduce image size
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        apt-utils \
        gcc \
        libpq-dev \
        python3-dev \
        python3 \
        python3-pip \
        python3-xlrd \
        python3.11-venv \
        curl \
        && rm -rf /var/lib/apt/lists/*


# Set up virtual environment
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"

# Copy application code and install dependencies
WORKDIR /home/mosip/
COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt

# Define environment variables with default values
ENV DB_SERVERIP= \
    DB_PORT= \
    SU_USER= \
    DBUSER_PWD= \
    MOSIP_DB_NAME= \
    DML_FLAG= \
    DB_NAMES= \
    BATCH_SIZE= \
    AUDIT_SOURCE_DB_HOST= \
    AUDIT_SOURCE_DB_PORT= \
    AUDIT_SOURCE_DB_UNAME= \
    AUDIT_SOURCE_DB_PASS= \
    AUDIT_SOURCE_DB_NAME= \
    AUDIT_SOURCE_SCHEMA_NAME= \
    CREDENTIAL_SOURCE_DB_HOST= \
    CREDENTIAL_SOURCE_DB_PORT= \
    CREDENTIAL_SOURCE_DB_UNAME= \
    CREDENTIAL_SOURCE_DB_PASS= \
    CREDENTIAL_SOURCE_DB_NAME= \
    CREDENTIAL_SOURCE_SCHEMA_NAME= \
    ESIGNET_SOURCE_DB_HOST= \
    ESIGNET_SOURCE_DB_PORT= \
    ESIGNET_SOURCE_DB_UNAME= \
    ESIGNET_SOURCE_DB_PASS= \
    ESIGNET_SOURCE_DB_NAME= \
    ESIGNET_SOURCE_SCHEMA_NAME= \
    IDA_SOURCE_DB_HOST= \
    IDA_SOURCE_DB_PORT= \
    IDA_SOURCE_DB_UNAME= \
    IDA_SOURCE_DB_PASS= \
    IDA_SOURCE_DB_NAME= \
    IDA_SOURCE_SCHEMA_NAME= \
    IDREPO_SOURCE_DB_HOST= \
    IDREPO_SOURCE_DB_PORT= \
    IDREPO_SOURCE_DB_UNAME= \
    IDREPO_SOURCE_DB_PASS= \
    IDREPO_SOURCE_DB_NAME= \
    IDREPO_SOURCE_SCHEMA_NAME= \
    KERNEL_SOURCE_DB_HOST= \
    KERNEL_SOURCE_DB_PORT= \
    KERNEL_SOURCE_DB_UNAME= \
    KERNEL_SOURCE_DB_PASS= \
    KERNEL_SOURCE_DB_NAME= \
    KERNEL_SOURCE_SCHEMA_NAME= \
    MASTER_SOURCE_DB_HOST= \
    MASTER_SOURCE_DB_PORT= \
    MASTER_SOURCE_DB_UNAME= \
    MASTER_SOURCE_DB_PASS= \
    MASTER_SOURCE_DB_NAME= \
    MASTER_SOURCE_SCHEMA_NAME= \
    PMS_SOURCE_DB_HOST= \
    PMS_SOURCE_DB_PORT= \
    PMS_SOURCE_DB_UNAME= \
    PMS_SOURCE_DB_PASS= \
    PMS_SOURCE_DB_NAME= \
    PMS_SOURCE_SCHEMA_NAME= \
    REGPRC_SOURCE_DB_HOST= \
    REGPRC_SOURCE_DB_PORT= \
    REGPRC_SOURCE_DB_UNAME= \
    REGPRC_SOURCE_DB_PASS= \
    REGPRC_SOURCE_DB_NAME= \
    REGPRC_SOURCE_SCHEMA_NAME= \
    RESIDENT_SOURCE_DB_HOST= \
    RESIDENT_SOURCE_DB_PORT= \
    RESIDENT_SOURCE_DB_UNAME= \
    RESIDENT_SOURCE_DB_PASS= \
    RESIDENT_SOURCE_DB_NAME= \
    RESIDENT_SOURCE_SCHEMA_NAME= \
    ARCHIVE_DB_HOST= \
    ARCHIVE_DB_PORT= \
    ARCHIVE_DB_UNAME= \
    ARCHIVE_DB_PASS= \
    ARCHIVE_DB_NAME= \
    ARCHIVE_SCHEMA_NAME= \
    CONTAINER_VOLUME_PATH=

# Set entrypoint
ENTRYPOINT ["./entrypoint.sh"]
