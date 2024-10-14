pipeline{
    agent any
    stages {
    
        stage('Setup Python Virtual ENV for dependencies'){
       
      steps  {
            sh '''
            chmod +x envsetup.sh
            ./envsetup.sh
            '''}
        }
       
    }
}
