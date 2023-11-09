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
                -Dsonar.projectKey=test-2 \
                -Dsonar.host.url=http://13.233.167.66:32768 \
                -Dsonar.login=sqp_3806ff90f614893a00eb0b0657d0e04312fb6f14"
            }
        }
        stage("build"){
            steps{
                sh 'docker image build -t newsanta2$BUILD_TAG .'
            }
        }
        stage("run"){
            steps{
                sh 'docker run -d -P newsanta2$BUILD_TAG'
            }
        }
        stage("upload"){
            steps{
                nexusArtifactUploader artifacts: [[artifactId: 'secretsanta-generator', classifier: '', file: 'target/secretsanta-0.0.1-SNAPSHOT.jar', type: 'jar']], credentialsId: 'nexus', groupId: 'org.springframework.boot', nexusUrl: '13.233.167.66:32769', nexusVersion: 'nexus3', protocol: 'http', repository: 'test-repo', version: '2.3.1.RELEASE'
            }
        }
    }
}
