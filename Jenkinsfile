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
                -Dsonar.host.url=http://65.1.147.248:32768 \
                -Dsonar.login=sqp_2b64ac98df3b35b6d5d3ab53bf9c2b02e3917b64"
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
