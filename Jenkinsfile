pipeline {
    agent any

    environment {
        GIT_REPO_URL = 'https://github.com/TanyaYadav8266/frontpage.git'
        GIT_CREDENTIALS_ID = 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINh6XWjpFhYdOtx3f8o4Qp0FKFO8KEYp+pv5uUrR6UGl tanya8266y@gmail.com'  // The ID you provided when adding the SSH key
    }

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    // Checkout the code using SSH credentials
                    checkout([$class: 'GitSCM',
                        branches: [[name: '*/main']],
                        doGenerateSubmoduleConfigurations: false,
                        extensions: [],
                        userRemoteConfigs: [[
                            url: "${GIT_REPO_URL}",
                            credentialsId: "${GIT_CREDENTIALS_ID}"
                        ]])
                }
            }
        }

        stage('Build') {
            steps {
                echo "Building project..."
                // Your build steps here
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying project..."
                // Your deploy steps here
            }
        }
    }
}
