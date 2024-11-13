pipeline {
    agent any

    environment {
        // Example environment variable
        TEST_ENV_VAR = 'CI_TEST'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub (ensure you have a repo URL)
                git branch: 'main', url: 'https://github.com/r-ramos2/cicd-example.git'
            }
        }

        stage('Build') {
            steps {
                // Example of a simple build process (e.g., install dependencies)
                echo 'Building the project...'
                sh 'echo "Building the project..."'
            }
        }

        stage('Test') {
            steps {
                // Run tests (example using a shell command)
                echo 'Running tests...'
                sh 'echo "Running tests..."'
            }
        }

        stage('Archive Results') {
            steps {
                // Archive test results (for example, a test result file or log)
                echo 'Archiving results...'
                archiveArtifacts artifacts: '**/test-*.log', allowEmptyArchive: true
            }
        }

        stage('Deploy') {
            steps {
                // Example deployment step
                echo 'Deploying application...'
                sh 'echo "Deploying to the environment..."'
            }
        }
    }

    post {
        always {
            // Cleanup steps, if needed
            echo 'Cleaning up...'
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed. Please check the logs.'
        }
    }
}
