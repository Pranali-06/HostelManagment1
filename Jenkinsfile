pipeline {
    agent any

    environment {
        IMAGE_NAME = "hostel-managment-app"
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
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Run Container') {
            steps {
                echo 'Stopping old container if exists...'
                sh "docker rm -f ${CONTAINER_NAME} || true"

                echo 'Running new container...'
                sh "docker run -d --name ${CONTAINER_NAME} -p ${HOST_PORT}:${CONTAINER_PORT} ${IMAGE_NAME}"
            }
        }
    }

    post {
        success {
            echo 'Deployment successful! Your app should be reachable at http://<public-ip>:8081'
        }
    }
}
