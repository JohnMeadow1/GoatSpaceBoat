extends Node2D
class_name Page


var indexPage:int = 1


func _goto_page(page:int) -> void:
	Singleton.Book.changePage(page)


func _on_NextPage_pressed():
	Singleton.Book.nextPage()
	pass # Replace with function body.


func _on_PrevPage_pressed():
	Singleton.Book.prevPage()
	pass # Replace with function body.


func _on_Index_pressed():
	Singleton.Book.changePage(indexPage)
	pass # Replace with function body.
