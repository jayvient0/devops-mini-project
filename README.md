# Node.js CI/CD & AWS EC2 Deployment

An automated CI/CD pipeline that builds a containerized Node.js Express API and deploys it to AWS EC2 using Docker and GitHub Actions.

##  Tech Stack
* **Application:** Node.js, Express
* **Containerization:** Docker
* **CI/CD & Registry:** GitHub Actions, GitHub Container Registry (GHCR)
* **Cloud Infrastructure:** AWS EC2 (Ubuntu Linux)

##  Workflow
1. **Push:** Code committed to `main` branch triggers GitHub Actions.
2. **Build:** Pipeline runs tests and builds the Docker image.
3. **Publish:** Image is pushed to GHCR.
4. **Deploy:** Pipeline SSHs into AWS EC2, pulls the updated image, and restarts the container.

##  Local Setup

```bash
# Clone repository
git clone [https://github.com/jayvient0/devops-mini-project.git](https://github.com/jayvient0/devops-mini-project.git)
cd devops-mini-project

# Run with Docker
docker build -t devops-mini-project .
docker run -d -p 3000:3000 devops-mini-project
