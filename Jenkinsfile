pipeline {
    agent any

    environment {
        IMAGE_NAME = "hostel-management-app"
        CONTAINER_NAME = "hostel_container"
        HOST_PORT = "8080"
        CONTAINER_PORT = "8080"
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source code from GitHub...'
                checkout scm
            }
        }

        stage('Build Maven Project') {
            steps {
                echo 'Building Maven project...'
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh "docker build -t hostel-management-app ."
            }
        }

       
    }

    post {
        success {
            echo 'Deployment successful! http://54.163.203.125:8081'
        }
    }
}
