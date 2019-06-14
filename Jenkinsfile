pipeline {
    agent any
    stages {
        stage ('Build'){
            steps {
                echo "Building docker image..."
                sh 'docker image build -t img .'
            }
        }
        stage ('Test') {
            steps {
                echo "Performing tests in docker container..."
                sh 'docker container exec img python /usr/src/app/tests.py'
            }
        }
        stage ('Deploy') {
            steps {
                echo "Stopping & removing all running containers, removing all images"
                sh 'docker container stop $(docker ps -aq)'
                sh 'docker image prune'
                echo "Running ~~our~~ magnificent app"
                sh 'docker container run --rm -d --name img -p 80:5000 -v $(pwd)/db:/usr/src/app/db img'
            }
        }

    }
}