extends Control
class_name Page

var book: Control

func _ready() -> void:
	$Navigation/CurrentPageLabel.text = str(book.currentPage).pad_zeros(2)

func _goto_page(page:int) -> void:
	book.changePage(page)

func _on_NextPage_pressed():
	book.nextPage()

func _on_PrevPage_pressed():
	book.prevPage()

func _on_Index_pressed():
	book.changePage(1)
