pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: '2841e856-8548-4047-a5ab-e2f13dbd4e84', passwordVariable: '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', usernameVariable: 'shruti89041')]) {
                        git credentialsId: '2841e856-8548-4047-a5ab-e2f13dbd4e84', url: 'https://github.com/shruti89041/nodeApplication.git', branch: 'main'
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
                    docker.image('nodeapp').run('-p 4000:4000')
                }
            }
        }
    }
}
