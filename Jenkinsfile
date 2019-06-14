pipeline {
    agent any
    stages {
        stage ('Build'){
            steps {
                echo "starting stuff... "
                sh 'docker image build -t img .'
            }
        }
        stage ('Test') {
            steps {
                sh 'docker container exec img ls -l'
                sh "docker container exec img python tests.py"
            }
        }
        stage ('Deploy') {
            steps {
                // check if something is running
                sh 'docker container stop $(docker ps -aq)'
                // sh 'docker container prune'
                sh 'docker container run --rm -d --name img -p 80:5000 img'
            }
        }

    }
}