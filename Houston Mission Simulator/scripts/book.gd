extends Node2D
class_name BookClass

onready var PageInstance: = $PagePlace/Page

export(int) var currentPage:int = 1
export(int) var maxPage:int = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	Singleton.Book = self
	loadPage(currentPage)
	pass # Replace with function body.


func changePage(page:int) -> void:
	if page > maxPage || page < 1:
		return
	
	currentPage = page
	$CurrentPageLabel.text = str(currentPage).pad_zeros(2)
	loadPage(page)
	pass


func nextPage() -> void:
	changePage(currentPage + 1)


func prevPage() -> void:
	changePage(currentPage - 1)


func loadPage(page:int) -> void:
	var pagePath:String = "res://Houston Mission Simulator/pages/page_" + str(page).pad_zeros(2) + ".tscn"
	var new_node:PackedScene = load(pagePath) as PackedScene
	PageInstance.queue_free()
	PageInstance = new_node.instance()
	$PagePlace.add_child(PageInstance)
