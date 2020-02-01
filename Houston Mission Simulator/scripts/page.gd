extends Node2D
class_name Page


var indexPage:int = 1


func _goto_page(page:int) -> void:
	VariableMaster.Book.changePage(page)


func _on_NextPage_pressed():
	VariableMaster.Book.nextPage()
	pass # Replace with function body.


func _on_PrevPage_pressed():
	VariableMaster.Book.prevPage()
	pass # Replace with function body.


func _on_Index_pressed():
	VariableMaster.Book.changePage(indexPage)
	pass # Replace with function body.
