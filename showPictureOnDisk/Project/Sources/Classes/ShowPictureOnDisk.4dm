Class constructor
	var $1 : Object
	
Function onInvoke
	var $1; $0 : Object
	var $ob : Object
	var $pictureFile : Object
	
	If ($1.editor.currentSelection.length>0)
		For each ($objectName; $1.editor.currentSelection)
			$ob:=OB Get:C1224($1.editor.currentPage.objects; $objectName; Is object:K8:27)
			If ($ob.type="picture")
				$pictureFile:=File:C1566($1.editor.file.parent.path+$ob.picture)
				If ($pictureFile.exists)
					SHOW ON DISK:C922($pictureFile.platformPath)
				End if 
				
			End if 
		End for each 
	End if 
Function onError
	
	var $1; $2 : Object
	var $3 : Collection
	