pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Cloning the GitHub repository (modify URL if needed)
                git branch: 'main', url: 'https://github.com/r-ramos2/cicd-example.git'
            }
        }

        stage('Docker Build') {
            steps {
                // Build the Docker image for NGINX
                script {
                    docker.build("nginx-service:latest")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                // Run the NGINX Docker container locally
                script {
                    docker.image("nginx-service:latest").run("-d -p 80:80")
                }
            }
        }
    }

    post {
        always {
            // Clean up Docker container if needed
            sh 'docker rm -f $(docker ps -aq --filter ancestor=nginx-service:latest) || true'
        }
        success {
            echo 'NGINX build and deployment stages completed successfully!'
        }
        failure {
            echo 'Build or deployment failed. Check logs for details.'
        }
    }
}
