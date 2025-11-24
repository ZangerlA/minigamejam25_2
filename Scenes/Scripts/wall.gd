extends StaticBody2D

@export var number : String = "1"

func _ready():
	# 1. Ottiene il nome dell'istanza del nodo corrente
	var instance_name: String = self.name
	
	# 2. Controlla che il nome non sia vuoto
	if instance_name.is_empty():
		print("Errore: Il nome dell'istanza è vuoto.")
		$Label.text = "0"

	# 3. Prende l'ultimo carattere del nome
	# [-1] è l'indice per accedere all'ultimo carattere della stringa
	var last_char: String = instance_name.right(1)
	
	var number_to_process: int
	
	# 4. Controlla il carattere
	if last_char.is_valid_int():
		# Se è un numero valido, lo converte a intero
		number_to_process = last_char.to_int()
		
	else:
		# Per qualsiasi altro carattere non numerico
		number_to_process = 0

	# 5. Applica l'operazione modulo 10
	var result: int = number_to_process % 10
	
	$Label.text = str(result)
