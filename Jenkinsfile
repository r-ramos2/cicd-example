pipeline {
    agent any

    stages {
        stage('Install NGINX') {
            steps {
                // Install NGINX using Homebrew
                sh 'brew install nginx'
            }
        }

        stage('Start NGINX') {
            steps {
                // Start the NGINX service
                sh 'brew services start nginx'
            }
        }

        stage('Configure NGINX') {
            steps {
                // Optional: Modify NGINX configuration as needed
                script {
                    def nginxConf = '/opt/homebrew/etc/nginx/nginx.conf'
                    sh "echo '# Custom NGINX Configuration' >> ${nginxConf}"
                    // Add any other configuration commands here if needed
                }
            }
        }
    }

    post {
        always {
            // Clean up by stopping NGINX
            sh 'brew services stop nginx'
        }
        success {
            echo 'NGINX installation and startup completed successfully!'
        }
        failure {
            echo 'NGINX setup failed. Check logs for details.'
        }
    }
}
