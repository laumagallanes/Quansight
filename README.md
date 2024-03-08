# Quansight Infrastructure Engineering Tech Challenge
## Containerize a Python application

You are the infrastructure engineer on a fully remote and distributed team. Your team is who is developing a Python API using the FastAPI framework. Lately, your team has been having issues with dependency version differences causing the app to behave differently or not work at all. The problems are not consistent across all team members and you see "Works on my machine!" in Slack a lot.

Your team is working towards a Proof of Concept (POC) launch of the API. This launch is scheduled for next week. To support the launch, you need to build a production-ready setup. Since the application is still in heavy development you don't want to make the version differences worse by adding yet another environment. Your team decides to use Docker to build a setup that can be used for development and production.
## The Task

Using Docker and Terraform, containerize a Python application fronted by an nginx reverse proxy and show us your understanding about how to deploy an application securely while still allowing for low friction development.

Specifically we will be looking for the following in your submission:
1. Secure and performant settings in your nginx configuration, including SSL/TLS specifics
2. Usage of the principle of least privilege/surprise
3. Docker and Terraform best practices including security, configuration, and image size

### Part One

Complete the provided `nginx/nginx.conf` by writing a server directive(s) that proxies to the upstream application.

Requirements:

1. Nginx should accept requests on ports 80 and 443
2. All HTTP requests should permanently redirect to their HTTPS equivalent
3. Use the provided SSL keypair found in nginx/files/localhost.crt and nginx/files/localhost.key for your SSL configuration
4. Ensure the SSL keypair is available to nginx, but is not baked in to the container image
5. The SSL configuration should use modern and secure protocols and ciphers
6. Nginx should proxy requests to the application using an upstream directive
7. Pass headers X-Forwarded-For, X-Real-IP, and X-Forwarded-Proto to the upstream application with appropriate values

### Part Two

Complete app/Dockerfile, infrastructure/main.tf to produce a production ready image that can be also be used for development.

Requirements:

1. The app found in ./app/src is securely built, installed, and configured into a container.
2. When run by itself, the app container should start the app, serving traffic using `uvicorn`, on port 8000 without any extra configuration.
3. Running `terraform apply` should:
    1. Start the app container in development mode listening on port 8000
    2. Allow local edits of the app source to be reflected in the running app container without restart (eg: hot code reload)
    3. Start an nginx container configured with the files from Part One
    4. The app service should not reachable directly from the host and can only be accessed through the nginx service.

## Expected Outcome

After running `terraform apply`:
You should be able to run
```
curl -X 'POST' \
  'https://localhost/token' --insecure \
  -H 'accept: application/json' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d 'grant_type=&username=johndoe&password=secret&scope=&client_id=&client_secret='
```
to get a token and then run
```
curl -X 'GET' \
  'https://localhost/users/me/' --insecure \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer MyBearerTokenValue
```
and get a response like:
```
{
    "user": {
        "username": "johndoe",
        "email": "johndoe@example.com",
        "full_name": "John Doe",
        "disabled": false,
        "hashed_password": "$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW"
    },
    "X-Forwarded-For": "172.20.0.1"
    "X-Real-IP": "172.20.0.1"
    "X-Forwarded-Proto": "https"
    "Msg": "Quansight: Turning Data Into Insights With Open Source Software"
}
```

## Tips & Guidance
### Tips

* Windows 10 Home users will need to use Docker toolbox or will need to do the exercise in a Linux VM / cloud instance since Docker Desktop for Windows requires Hyper-V, a Pro only feature.

### Dos
1. Do add notes on running your solution and why you choose your particular solution in a COMMENTS.md file. Remember, you are working with a remote team. Written communication is important!
2. Do feel free to offer suggestions or feedback on this exercise

### Do Nots
1. Do not worry about data persistence, scaling, or OCSP stapling
2. Do not worry about the application code, or tuning Uvicorn. Assume they are already production quality.
