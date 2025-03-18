pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'frontpage-php-apache'  // Define the Docker image name
        CONTAINER_NAME = 'php-app'  // Define the container name
        PORT = '8082'  // Port to map in the container
        GIT_REPO_URL = 'https://github.com/TanyaYadav8266/frontpage.git'  // GitHub repository URL
        GIT_CREDENTIALS_ID = 'github key'  // The Jenkins SSH key credentials ID
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo "Cloning repository..."
                checkout([$class: 'GitSCM',
                    branches: [[name: '*/main']],
                    doGenerateSubmoduleConfigurations: false,
                    extensions: [],
                    userRemoteConfigs: [[
                        url: "${GIT_REPO_URL}",
                        credentialsId: "${GIT_CREDENTIALS_ID}"
                    ]]
                ])
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                bat "docker build -t $DOCKER_IMAGE ."
            }
        }

        stage('Run Unit Tests') {
            steps {
                echo "Running tests..."
                // Assuming your Dockerfile runs the tests, you can use the following command
                bat """
                docker run --rm $DOCKER_IMAGE npm test  # or your relevant test command
                """
            }
        }

        stage('Stop and Remove Old Container') {
            steps {
                echo "Stopping and removing old container (if exists)..."
                bat """
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                """
            }
        }

        stage('Deploy New Container') {
            steps {
                echo "Deploying new container..."
                bat """
                docker run -d -p $PORT:80 --name $CONTAINER_NAME $DOCKER_IMAGE
                """
            }
        }

        stage('Post Deployment') {
            steps {
                echo "Deployment successful! Access the application at http://localhost:$PORT"
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check logs for details.'
        }
    }
}
