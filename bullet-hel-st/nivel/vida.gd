extends HBoxContainer

func actualizar_corazones(vidas: int):		
	var corazones = get_children()
	for i in range(corazones.size()):
		if i < vidas:
			corazones[i].show()	
		else:	
			corazones[i].hide()			
				
