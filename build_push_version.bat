set SERVICE_VERSION=v16

if not defined SERVICE_VERSION (
    echo Error: SERVICE_VERSION is not defined in service_version_number.bat.
    exit /b 1
)

echo "Creating and using Docker Buildx builder..."
docker buildx create --use || docker buildx use default

echo "Building and pushing multi-platform Docker image..."
docker buildx build --platform linux/amd64,linux/arm64 -f Dockerfile -t ion21/serv1:%SERVICE_VERSION% --push .

echo "Script completed."