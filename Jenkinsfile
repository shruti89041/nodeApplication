pipeline {
    agent any

    stages {
        stage('Install Git') {
            steps {
                script {
                    // Switch to root user for installation
                    sh 'sudo apt-get update'
                    sh 'sudo apt-get install -y git'
                }
            }
        }
        stage('Clone Repository') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: '536cb47f-b978-43fa-a1cc-1e281945ec86', passwordVariable: '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', usernameVariable: 'shruti89041')]) {
                        git credentialsId: '536cb47f-b978-43fa-a1cc-1e281945ec86', url: 'https://github.com/shruti89041/nodeApplication.git', branch: 'main'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('nodeapp')
                }
            }
        }


        stage('Push Docker Image') {
            steps {
                script {
                    // Use Docker Hub credentials to push the image
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'QWEASDzx78@$', usernameVariable: 'shrutifarkya')]) {
                        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                            docker.image('nodeapp').push()
                        }
                    }
                }
            }
        }

        stage('Pull and Run Docker Image') {
            steps {
                script {
                    docker.image('nodeapp').withRun('-p 4000:4000')
                }
            }
        }
    }
}
