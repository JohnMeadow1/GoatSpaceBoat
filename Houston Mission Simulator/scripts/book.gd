extends Control

onready var page_place := $PagePlace
var page: Control

export(int) var currentPage:int = 0
export(int) var maxPage:int = 20

func _ready():
	loadPage()

func changePage(page:int) -> void:
	if page > maxPage || page < 0:
		return
	
	currentPage = page
	loadPage()

func nextPage() -> void:
	changePage(currentPage + 1)

func prevPage() -> void:
	changePage(currentPage - 1)

func loadPage() -> void:
	if page:
		page.queue_free()
	
	page = load("res://Houston Mission Simulator/pages/page_" + str(currentPage).pad_zeros(2) + ".tscn").instance()
	page.book = self
	page_place.add_child(page)

