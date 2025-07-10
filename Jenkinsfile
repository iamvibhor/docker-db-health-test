pipeline {
    agent any

    environment {
        IMAGE_NAME = "backend:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'make build'
            }
        }

        stage('Scan') {
            steps {
                sh 'make scan'
            }
        }

        stage('Healthcheck') {
            steps {
                sh 'make healthcheck || true'
            }
        }

        stage('Docker Compose Up') {
            steps {
                sh 'make up'
            }
        }

        stage('Post Checks') {
            steps {
                sh 'curl --fail http://localhost:3000/health || exit 1'
            }
        }

        stage('Down') {
            steps {
                sh 'make down'
            }
        }
    }

    post {
        always {
            echo 'Cleaning workspace...'
            cleanWs()
        }
    }
}
