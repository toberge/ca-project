pipeline {
    agent any
    stages {
        stage ('Test'){
            echo "running tests: "
            sh 'pwd'
            sh "python tests.py"
        }
        stage ('Build'){
            agent {
                dockerfile {
                    filename 'Dockerfile'
                    label 'label-for-nodes'
                    args '-d -v /tmp:/tmp --name img -p 80:5000'
                }
            }
            steps {
                echo "starting stuff... "

            }
        }
        stage ('Result'){
            echo "result: "
            sh 'docker container stop img'
            sh 'docker image rm img'
        }
    }
}