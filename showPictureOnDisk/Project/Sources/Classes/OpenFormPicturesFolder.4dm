Class constructor
	var $1 : Object
	
Function onInvoke
	var $1; $0 : Object
	var $imagesFolder : Object
	
	$imagesFolder:=Folder:C1567($1.editor.file.parent.path+"Images")
	If (Not:C34($imagesFolder.exists))
		$imagesFolder.create()
	End if 
	
	SHOW ON DISK:C922($imagesFolder.platformPath)
	
Function onError
	
	var $1; $2 : Object
	var $3 : Collection
	