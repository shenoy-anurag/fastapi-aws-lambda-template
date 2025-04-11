# FastAPI AWS Lambda Template
A FastAPI AWS Lambda Template for quickly deploying an app to AWS Lambda using AWS ECR.

Follow my step-by-step blog post to deploy this app to AWS Lambda in half an hour.

https://www.anuragshenoy.com/blog/fastapi-deployment-using-aws-lambda

## What makes this template different?
- **Use of Docker Compose for Lambda Deployment**
  - No need for `.tar.gz` files; simplifies the deployment process.
  - Supports deployment to AWS Lambda regardless of processor architecture (e.g., `arm64`/`aarch64` or `x86_64`).
  - Tested using M1 Mac (arm64 architecture).
- **Full-fledged FastAPI Application**
  - Unlike most examples that focus on single-file, single-endpoint setups, this template supports building a complete backend for hobby or production projects on Lambda.
- **Database Integration**
  - Includes support for database connections, which is often missing in other templates.  
  - Designed to handle Lambda's ephemeral nature by recommending transaction-pooler connection strings for external databases to avoid connection loss during cold starts.

- **No Built-in Model Inference**
  - A lot of examples show model inference on Lambda using FastAPI.
  - Unless your model is tiny, say a regression model, decision tree or a boosting model, the startup time of Lambda defeats the purpose. Latency will be quite high unless it's warmed up. 
  - It makes more sense to use an external API for inference (e.g., OpenAI, Mistral, Anthropic, AWS Bedrock) for better performance and scalability.

## Technology Stack and Features
- ⚡ FastAPI for the Python backend API.
  - 🧰 SQLModel for the Python SQL database interactions (ORM).
  - 🔍 Pydantic, used by FastAPI, for the data validation and settings management.
  - 💾 PostgreSQL as the SQL database.
  - 🎟️ Mangum to handle AWS Lambda events.
- 🐋 Docker Compose for development and production.
- 🔒 Secure password hashing by default.
- 🔑 JWT (JSON Web Token) authentication.
- 🚢 Deployment instructions using Docker Compose.

## Acknowledgements
### FastAPI Fullstack Template 
https://github.com/fastapi/full-stack-fastapi-template

This repository has a heavily modified version of the Full Stack FastAPI Template.

### Key Modifications
- **MVC Design Pattern**: Improves code organization and scalability for larger projects.
- **Mangum Integration**: Enables seamless handling of AWS Lambda events, making it easy to deploy FastAPI applications to Lambda.
- **Custom Dockerfile**: Optimized for building images compatible with AWS Lambda's runtime environment.
- **Enhanced Security**: Includes examples of protecting endpoints with user and super-user tokens, demonstrating how to secure APIs effectively.

## How To Use It

You can just fork or clone this repository and use it as is.

✨ It just works. ✨

Follow my step-by-step blog post to deploy this app to AWS Lambda in half an hour. **After following steps 1 - 4 below**.

https://www.anuragshenoy.com/blog/fastapi-deployment-using-aws-lambda

### 1. Clone the Repository
```bash
git clone https://github.com/shenoy-anurag/fastapi-aws-lambda-template.git
cd fastapi-aws-lambda-template
```

### 2. Configuration
- Rename the `.env.sample` file to `.env` and replace all variables with your setup.
  - `mv .env.sample .env`
  - Replace the placeholder variables in .env with your setup (e.g., database connection string, secret keys).
- Tip: For the database, if using an external provider, use their transaction-pooler connection string. Long-standing connections are lost whenever lambda spins down.

### 3. For local development
#### Install dependencies
- Change directory to backend `cd backend`.
- If using uv: `uv lock`, then `uv sync`.
- If using poetry: `poetry install`
- If using pip: `pip install -r requirements.txt`
#### Activate the environment
- If using uv or pip: `source .venv/bin/activate`.
- If using poetry: `poetry shell`
#### Run the application locally
`python main.py`

### 4. Preparing dependencies for Lambda deployment
- `backend/scripts/aws_lambda_prep.sh` contains the commands to generate your `requirements.txt` file for installing dependencies to the lambda python image. Use the appropriate command depending on whether you are using poetry or uv.

### 5. Deploy to AWS Lambda
Follow my step-by-step blog post to deploy this app to AWS Lambda in half an hour.

https://www.anuragshenoy.com/blog/fastapi-deployment-using-aws-lambda

### Miscellaneous
#### Generating Secret Keys
Learn how to generate secrets:
https://www.anuragshenoy.com/blog/generate-secret-keys

Alternatively:

```python -c "import secrets; print(secrets.token_urlsafe(32))"```

#### Adding Environment variables to Lambda
1. Follow the blog post to create a Lambda function.
2. Deploy the image to the function.
3. Go to the **Configuration** tab of the Lambda function, and into the **Environment Variables** sidebar menu. Click "Edit" and add all the environment variables there.

Alternatively, you can setup AWS Secret Manager (not covered in the blog post or in this readme).

## License
The FastAPI AWS Lambda Template is licensed under the terms of the MIT license.
