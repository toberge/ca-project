pipeline {
    agent any
    stages {
        stage ('Build'){
            steps {
                echo "Removing previous images and building new docker image..."
                sh 'docker image prune'
                sh 'docker image build -t img .'
            }
        }
        stage ('Test') {
            steps {
                echo "Performing tests in docker container..."
                sh 'docker container run --rm img python /usr/src/app/tests.py'
            }
        }
        stage ('Deploy') {
            steps {
                echo "Stopping and removing all running containers"
                sh 'docker container stop $(docker ps -aq)'
                echo "Running ~~our~~ magnificent app"
                sh 'docker container run --rm -d --name img -p 80:5000 -v /home/ubuntu/db:/usr/src/app/db img'
            }
        }

    }
}
