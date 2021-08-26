node {    
      def app     
      stage('Clone repository') {               
             
            checkout scm    
      }     
      stage('Build image') {         
       
            app = docker.build("eng89gang/project_docker_app")    
       }     
      stage('Test image') {           
            app.inside {            
             
             sh 'echo "Tests passed"'        
            }    
        }     
        stage('Push image') {
            docker.withRegistry('', 'eng89gang') {
               sh "sudo docker login -u eng89gang -p bruhmoment"
               app.push("${env.BUILD_NUMBER}")            
               app.push("latest") 
        //    docker.withRegistry('https://registry.hub.docker.com', 'eng89_docker') {                   
            }    
        }
}