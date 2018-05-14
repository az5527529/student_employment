function closeAllLayer(){
			layer.closeAll('page');
		}

function nullOrEmpt(filepath){
	var flag = false;
	if(filepath == "" || filepath == undefined || filepath == null){
		 return flag;
	}
	return true;
}