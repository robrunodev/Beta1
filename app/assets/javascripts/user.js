function createUser(status, msg, id){
	fnDefaultMessage(msg);
	if (status == '200'){
		window.location.href = "/users/" + id
	}		
}

//funcao de validacao de campos da busca de usuario
function validateFormSearchUser(){
  console.log('validateFormSearchUser')
 
  $('form').submit(
    function(){
      var form_ok = true
      
      if ( !validate($("#search")) ){
        form_ok = false;
      }
      if (form_ok){
        true;
      } else {
        event.preventDefault();
        fnDefaultMessage('Preecha todos os campos obrigatórios')
      }
    }
  );  
}