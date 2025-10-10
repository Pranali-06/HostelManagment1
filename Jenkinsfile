pipeline {
    agent any

    environment {
        IMAGE_NAME = "hostel-managment-app"
        CONTAINER_NAME = "hostel_container"
        APP_PORT = "8080"
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

        stage('Run Container') {
    steps {
        echo 'Running new container...'
        sh '''
        docker rm -f hotel_container || true
        docker run -d --name hostel_container -p 8080:8080 hostel-managment-app
        '''
      }
    }


    }

    post {
        success {
            echo 'Deployment successful!'
        }
      
    }
}
