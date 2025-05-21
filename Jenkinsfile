pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'karunya08/finaldevopsproject'
    }

    stages {
        stage('Prepare Workspace') {
            steps {
                // Create the .m2repo directory with writable permissions
                sh 'mkdir -p target/.m2repo && chmod -R 777 target/.m2repo'
            }
        }

        stage('Build with Maven') {
            steps {
                script {
                    docker.image('maven:latest').inside {
                        sh 'mvn -T 4 -Dmaven.repo.local=target/.m2repo clean install'
                    }
                }
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        }
    }
}
