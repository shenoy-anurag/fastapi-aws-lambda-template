# FastAPI AWS Lambda Template
A FastAPI AWS Lambda Template for quickly deploying an app to AWS Lambda using AWS ECR.

Follow my step-by-step blog post to deploy this app to AWS Lambda in half an hour.

https://www.anuragshenoy.com/blog/fastapi-deployment-using-aws-lambda

## Technology Stack and Features
- ⚡ FastAPI for the Python backend API.
  - 🧰 SQLModel for the Python SQL database interactions (ORM).
  - 🔍 Pydantic, used by FastAPI, for the data validation and settings management.
  - 💾 PostgreSQL as the SQL database.
  - Mangum to handle AWS Lambda events.
- 🐋 Docker Compose for development and production.
- 🔒 Secure password hashing by default.
- 🔑 JWT (JSON Web Token) authentication.
- ✅ Tests with Pytest.
- 🚢 Deployment instructions using Docker Compose.

## Acknowledgements
### FastAPI Fullstack Template 
https://github.com/fastapi/full-stack-fastapi-template

This repository has a heavily modified version of the Full Stack FastAPI Template.

### Modifications
- Follows MVC design pattern.
- Mangum for AWS Lambda event handling.
- Dockerfile to build image for AWS Lambda.
- APIs showing how to protect endpoints -- requiring regular user and super-user tokens.

## How To Use It

You can just fork or clone this repository and use it as is.

✨ It just works. ✨

Follow my step-by-step blog post to deploy this app to AWS Lambda in half an hour.

https://www.anuragshenoy.com/blog/fastapi-deployment-using-aws-lambda

### Configuration
- Rename the `.env.sample` file to `.env` and replace all variables with your setup.
- Tip: For the database, if using an external provider, use their transaction-pooler connection string. Long-standing connections are lost whenever lambda spins down.
- `backend/scripts/aws_lambda_prep.sh` contains the commands to generate your `requirements.txt` file for installing dependencies to the lambda python image. Use the appropriate command depending on whether you are using poetry or uv.

### Generate Secret Keys
Learn how to generate secrets:
https://www.anuragshenoy.com/blog/generate-secret-keys

Alternatively:

```python -c "import secrets; print(secrets.token_urlsafe(32))"```

## License
The FastAPI AWS Lambda Template is licensed under the terms of the MIT license.
