pipeline {
    agent any

    tools {
        nodejs 'NodeJS'  // Ensure this matches the name you gave the NodeJS installation
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/r-ramos2/cicd-example.git'
            }
        }

        stage('Build') {
            steps {
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                sh 'npm test'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    docker.build("user-service:latest")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image("user-service:latest").run("-d -p 8080:8080")
                }
            }
        }
    }

    post {
        always {
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
