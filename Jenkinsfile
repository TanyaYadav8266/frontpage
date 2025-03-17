pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "frontpage-app"
        CONTAINER_NAME = "frontpage-container"
        PORT = "8082"
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo "Cloning repository..."
                git branch: 'main', url: 'https://github.com/TanyaYadav8266/frontpage.git', depth: 1
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh "docker build -t $DOCKER_IMAGE ."
            }
        }

        stage('Stop and Remove Old Container') {
            steps {
                echo "Stopping old container (if exists)..."
                sh """
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                """
            }
        }

        stage('Run New Container') {
            steps {
                echo "Deploying new container..."
                sh """
                docker run -d -p $PORT:80 --name $CONTAINER_NAME $DOCKER_IMAGE
                """
            }
        }

        stage('Post Deployment') {
            steps {
                echo "Deployment successful! Access the website at http://localhost:$PORT"
            }
        }
    }
}
