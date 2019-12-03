extends RichTextLabel

var lapsed = 0
var charNum = 0

func _ready():
    lapsed = 0
    set_visible_characters(0)

func _fixed_process(delta):
    lapsed = lapsed + delta

    get_visible_characters()

    charNum = set_visible_characters(lapsed / .03)
