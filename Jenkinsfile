pipeline {
    agent any
    stages {
        stage ('Build'){
            steps {
                echo "starting stuff... "
                sh 'docker image build -t img .'
            }
        }
        stage ('Run') {
            steps {
                // check if something is running
                sh 'docker container stop $(docker ps -aq)'
                sh 'docker container prune'
                sh 'docker container run --rm -d --name img -p 80:5000 img'
            }
        }
        stage ('Test') {
            steps {
                // move tests somewhere
                sh 'pwd'
                sh "docker container exec -d img python tests.py"
            }
        }

    }
}