pipeline {
    agent any
    stages {
        stage('Build') {
            when {
                expression {
                    return GIT_BRANCH in ['4.0-upgrade']
                }
            }
            steps {
                sh '''docker system prune -f'''
                def version = new Date().format('yyyyMMddHHmmss')
                script {
                    // TODO: get proper build
                    sh 'docker build '
                    // TODO: get proper login
                    sh 'docker login'
                    // TODO: get proper registry
                    docker.withRegistry('https://rep90.pvt.hawaii') {
                        docker.image("hawaii/grouper").push()
                        docker.image("hawaii/grouper").push(version)
                    }
                }
            }
        }
        stage('Deploy') {
            when {
                expression {
                    return GIT_BRANCH in ['4.0-upgrade']
                }
            }
            steps {
                script {
                    // TODO: work this out
                }
            }
        }
    }
    post {
        failure {
          step([$class: 'Mailer', notifyEveryUnstableBuild: true, recipients: emailextrecipients([[$class: 'CulpritsRecipientProvider'], [$class: 'RequesterRecipientProvider']])])
        }
        success {
          emailext body: '''${SCRIPT, template="groovy-text.template"}''', recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']], subject: '[Grouper] Build Success'
        }
      }
}