pipeline {
environment {
registry = "apurvanehete/softnauticsllp"
registryCredential = 'Docker_ID'
dockerImage = ''
}
agent any
stages {
stage('Cloning our Git') {
steps {
git branch: 'master', credentialsId: '872f84d6-0500-4d2d-ab78-ea58896914e0', url: 'https://github.com/apurvanehete/Docker_sample.git'
sh 'python3 Exe_1_python.py'
}
}
stage('Building our image') {
steps{
script {
  dockerImage = docker.build registry + ":$BUILD_NUMBER"
}
}
}
stage('Deploy our image') {
steps{
script {
  withCredentials([usernamePassword(credentialsId: 'Docker_ID', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
  sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
  sh 'docker push registry:$BUILD_NUMBER'}
}
}
}

stage('Cleaning up') {
steps{
sh "docker rmi $registry:$BUILD_NUMBER"
}
}
}
}
