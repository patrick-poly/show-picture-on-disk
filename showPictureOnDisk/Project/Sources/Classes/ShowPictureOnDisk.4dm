Class constructor
	var $1 : Object
	This:C1470.fileSystemPaths:=New collection:C1472("/DATA/"; "/LOGS/"; "/PACKAGE/"; "/RESOURCES/"; "/PROJECT"; "/SOURCES/")
	
	
Function onInvoke
	var $1; $0 : Object
	var $ob : Object
	var $pictureFile : Object
	var $picturePath; $fs; $objectName : Text
	
	
	If ($1.editor.currentSelection.length>0)
		For each ($objectName; $1.editor.currentSelection)
			$ob:=OB Get:C1224($1.editor.currentPage.objects; $objectName; Is object:K8:27)
			
			$objectPicturePath:=""
			$pictureFile:=Null:C1517
			
			$picturePath:=$ob.picture
			If ($picturePath="")
				$picturePath:=$ob.icon
			End if 
			
			If ($picturePath#"")
				// check for 4D file system path rel
				For each ($fs; This:C1470.fileSystemPaths)
					If ($picturePath=($fs+"@"))
						$pictureFile:=File:C1566($picturePath; *)
						break
					End if 
				End for each 
				
				If ($pictureFile=Null:C1517)
					// not a filesystem rel pat, so the path sould relatif to form folder path
					$pictureFile:=File:C1566($1.editor.file.parent.path+$picturePath; *)
				End if 
				
				If ($pictureFile.exists)
					SHOW ON DISK:C922($pictureFile.platformPath)
				End if 
			End if 
		End for each 
	End if 
Function onError
	
	var $1; $2 : Object
	var $3 : Collection
	
	