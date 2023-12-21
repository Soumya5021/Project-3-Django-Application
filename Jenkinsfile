pipeline{
    agent any
    stages{
        stage("Code"){
            steps{
                echo "Code cloned"
                git url:'https://https://github.com/shaiksulthanhussainvali/Project-3-Django-Application.git',
                branch:'main'
            }
        }
        stage("Build"){
            steps{
                sh "docker build . -t django-application"
            }
        }
        stage("Pushing to Docker Hub"){
            steps{
                withCredentials([usernamePassword(credentialsId:"Docker-Hub-Credentials",passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]){
                sh "docker tag django-notes-application ${env.DOCKER_USERNAME}/django-notes-application:latest"
                sh "docker login -u ${env.DOCKER_USERNAME} -p ${env.DOCKER_PASSWORD}"
                sh "docker push ${env.DOCKER_USERNAME}/django-notes-application:latest"
                }
            }
        }
        stage("Deploy"){
            steps{
                echo "deploy"
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}
