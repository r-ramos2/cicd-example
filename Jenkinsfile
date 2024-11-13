pipeline {
    agent any

    stages {
        stage('Install NGINX') {
            steps {
                sh 'brew install nginx'
            }
        }

        stage('Configure NGINX') {
            steps {
                script {
                    // Update NGINX configuration to listen on port 8081
                    def nginxConf = '/opt/homebrew/etc/nginx/nginx.conf'
                    sh "sed -i '' 's/listen 8080;/listen 8081;/' ${nginxConf}"
                }
            }
        }

        stage('Start NGINX') {
            steps {
                sh 'brew services start nginx'
            }
        }

        stage('Verify NGINX') {
            steps {
                // Check if NGINX is responding on the new port 8081
                script {
                    def response = sh(script: "curl -o /dev/null -s -w '%{http_code}' http://localhost:8081", returnStdout: true).trim()
                    if (response == '200') {
                        echo 'NGINX is running successfully on port 8081!'
                    } else {
                        error 'NGINX is not running as expected on port 8081.'
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
            echo 'NGINX installation, configuration, and verification completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the logs for details.'
        }
    }
}
