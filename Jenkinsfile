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
           docker.withRegistry('https://registry.hub.docker.com', 'eng89_docker') {            
               app.push("${env.BUILD_NUMBER}")            
               app.push("latest")        
              }    
           }
        }