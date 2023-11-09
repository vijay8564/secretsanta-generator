pipeline{
    agent any
    stages{
        stage('git'){
            steps{
                git 'https://github.com/vijaykumar8564/secretsanta-generator.git'
            }
        }
        stage("sonar"){
            steps{
                sh "mvn clean verify sonar:sonar \
                 -Dsonar.projectKey=pipeline \
                 -Dsonar.host.url=http://13.233.167.66:32768 \
                 -Dsonar.login=sqp_4722a73f92322f57c402e5be19898342eec5a064"
            }
        }
        stage("build"){
            steps{
                sh 'docker image build -t newsanta2 .'
            }
        }
        stage("run"){
            steps{
                sh 'docker run -d -P newsanta2'
            }
        }
    }
}
