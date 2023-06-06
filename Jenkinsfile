pipeline {
    agent {
        node {
            label 't058-runner'
        }
    }

    environment {
        PATH = "/opt/maven/bin:$PATH"
    }

 stages {
      stage('Preparation') {
         steps {
            cleanWs()
            git credentialsId: 'ca-git-access', branch: 'develop', url: "https://git.cloudavise.com/visops/t058/sample-java-app.git"
         }
      }

   
        stage("build code"){
            steps{
		sh 'cd webapp'
                sh 'mvn clean install'
            }
            
        }
      stage('Deploy Build') {
         steps {
             sh 'ansible-vault decrypt --vault-id /tmp/vault-id /opt/jenkins/workspace/VisOps/t058/sample-java-app/deploy-on-tomcat/master.pem'
            sh "ansible-playbook -i inventory deploy-on-tomcat.yaml" 
         }
      }

    }
}
