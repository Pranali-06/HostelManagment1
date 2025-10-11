pipeline {
    agent any

    environment {
        IMAGE_NAME = "hostel-management-app"
        CONTAINER_NAME = "hostel_container"
        HOST_PORT = "8081"
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
                sh "docker build -t hostel-managment-app ."
            }
        }

       
    }

    post {
        success {
            echo 'Deployment successful! Your app should be reachable at http://54.163.203.125:8081'
        }
    }
}
