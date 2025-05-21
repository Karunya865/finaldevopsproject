pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'karunya08/finaldevopsproject'
    }

    stages {
        // Maven Build Stage inside Docker
        stage('Build with Maven') {
            agent {
                docker {
                    image 'maven:latest'
                }
            }
            steps {
                sh 'mvn -T 4 clean install'
            }
        }

        // Docker Image Creation & Push
        stage('Build and Push Docker Image') {
            steps {
                // Grant executable permissions to the build script
                sh 'chmod +x deploy.sh'

                // Execute build script to build and push Docker image
                sh './deploy.sh'
            }
        }
    }
}
