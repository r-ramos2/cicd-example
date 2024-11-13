pipeline {
    agent any

    environment {
        NGINX_CONF = 'nginx.conf'  // Path to your custom NGINX config file
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/r-ramos2/cicd-example.git'
            }
        }

        stage('Install NGINX') {
            steps {
                script {
                    if (isUnix()) {
                        // Ensure Homebrew is installed if on macOS
                        sh '''
                        if ! command -v brew &>/dev/null; then
                            echo "Homebrew not found, installing..."
                            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
                        fi
                        brew install nginx
                        '''
                    } else {
                        echo "Unsupported OS for Homebrew install. Please use another method."
                    }
                }
            }
        }

        stage('Start NGINX') {
            steps {
                script {
                    // Start NGINX service
                    sh '''
                    sudo nginx
                    '''
                }
            }
        }

        stage('Configure NGINX') {
            steps {
                script {
                    // Optionally copy a custom nginx.conf
                    echo "Configuring NGINX..."
                    sh '''
                    if [ -f "$NGINX_CONF" ]; then
                        echo "Copying custom NGINX configuration..."
                        sudo cp $NGINX_CONF /usr/local/etc/nginx/nginx.conf
                        sudo nginx -s reload
                    else
                        echo "No custom NGINX config found, using default."
                    fi
                    '''
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            sh 'brew services stop nginx || echo "NGINX is not running"'
        }
    }
}
