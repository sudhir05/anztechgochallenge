# Summary
Below are the changes done in the dockerfile to implement caching and reduce size using multi-staging
- `CGO_ENABLED=0` has been added to build the code.
- cache using contacatinating several RUN statements.
- cache go modules using `go mod download`
- In order to reduce size copy only binary to the final image.
- Image size has come down to ~7.98 MB.

# How to run
- Dockerfile can be build using either `build.sh` or simply write - `docker build -t techanz .`
- Check the size of the image - `docker image list`
- To run the docker image - `docker run -dit -p 8000:8000 techanz`
