pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'karunya08/finaldevopsproject'
    }

    stages {
        stage('Prepare Workspace') {
            steps {
                script {
                    sh '''
                        sudo mkdir -p target/.m2repo
                        sudo chmod -R 777 target/.m2repo
                        sudo chown -R $(whoami) target/.m2repo
                    '''
                }
            }
        }

        stage('Build with Maven') {
            steps {
                script {
                    docker.image('maven:latest').inside('-u root') {
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
