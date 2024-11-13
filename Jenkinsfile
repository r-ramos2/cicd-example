pipeline {
    agent any

    stages {
        stage('Install NGINX') {
            steps {
                sh 'brew install nginx'
            }
        }

        stage('Start NGINX') {
            steps {
                sh 'brew services start nginx'
            }
        }

        stage('Verify NGINX') {
            steps {
                // Check if NGINX is responding on localhost
                script {
                    def response = sh(script: "curl -o /dev/null -s -w '%{http_code}' http://localhost:8080", returnStdout: true).trim()
                    if (response == '200') {
                        echo 'NGINX is running successfully!'
                    } else {
                        error 'NGINX is not running as expected.'
                    }
                }
            }
        }
    }

    post {
        always {
            // Stop NGINX after the pipeline completes
            sh 'brew services stop nginx'
        }
        success {
            echo 'NGINX installation, start, and verification completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the logs for details.'
        }
    }
}
