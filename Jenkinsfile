pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Cloning the GitHub repository
                git branch: 'main', url: 'https://github.com/r-ramos2/cicd-example.git'
            }
        }

        stage('Build') {
            steps {
                // Install project dependencies (assumes Node.js is already available on the Jenkins machine)
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                // Run any tests here (e.g., npm test) - adjust as needed
                sh 'npm test'
            }
        }

        stage('Docker Build') {
            steps {
                // Build Docker image locally
                script {
                    docker.build("user-service:latest")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                // Run the Docker container locally
                script {
                    docker.image("user-service:latest").run("-d -p 8080:8080")
                }
            }
        }
    }

    post {
        always {
            // Clean up Docker container if needed
            sh 'docker rm -f $(docker ps -aq --filter ancestor=user-service:latest) || true'
        }
        success {
            echo 'Build, test, and deployment stages completed successfully!'
        }
        failure {
            echo 'Build or deployment failed. Check logs for details.'
        }
    }
}
