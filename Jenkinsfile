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

 sh 'docker build . -t apurvanehete/softnauticsllp:1'
}
}
}
stage('Deploy our image') {
steps{
script {
docker.withRegistry( '', registryCredential ) {
dockerImage.push()
}
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
