pipeline {
    agent any
    stages {
        stage ('Initiate'){
            steps {
                echo "result: "
                sh 'docker container stop img'
                sh 'docker container rm img'
                sh 'docker image rm img'
            }
        }
        stage ('Build'){
            steps {
                echo "starting stuff... "
                sh 'docker image build --name img .'
            }
        }
        stage ('Run') {
            steps {
                // check if something is running
                sh 'docker container run --rm -d --name img -p 80:5000 img'
            }
        }
        stage ('Test') {
            steps {
                // move tests somewhere
                sh 'pwd'
                sh "python tests.py"
            }
        }

    }
}