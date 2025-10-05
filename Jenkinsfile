pipeline {
    agent any

    environment {
        IMAGE_NAME = "hotel-management-app"
        CONTAINER_NAME = "hotel_container"
        APP_PORT = "8000"
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
                sh "docker build -t hotel-management-app ."
            }
        }

        
        stage('Run Container') {
            steps {
                echo 'Running new container...'
                sh "docker run -d --name hotel_container -p 8000:8000 hotel-management-app"
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
      
    }
}
