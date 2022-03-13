::add color codes
set col_green=[32m
set col_red=[31m
set col_yellow=[33m
set col_white=[37m
set col_blue=[34m
set col_aqua=[36m
set col_darkred=[91m
set col_black=[30m
set col_reset=[0m

set bgcol_green=[42m
set bgcol_red=[41m
set bgcol_yellow=[43m
set bgcol_white=[47m
set bgcol_blue=[44m
set bgcol_aqua=[46m
set bgcol_darkred=[101m
set bgcol_black=[40m
set bgcol_reset=[0m

set fullcol_green=%col_green%%bgcol_green%
set fullcol_red=%col_red%%bgcol_red%
set fullcol_yellow=%col_yellow%%bgcol_yellow%
set fullcol_white=%col_white%%bgcol_white%
set fullcol_blue=%col_blue%%bgcol_blue%
set fullcol_aqua=%col_aqua%%bgcol_aqua%
set fullcol_darkred=%col_darkred%%bgcol_darkred%
set fullcol_black=%col_black%%bgcol_black%
set fullcol_reset=%col_reset%%bgcol_reset%

::add snake color
set game.block=#

set game.air=%fullcol_white%%game.block%%fullcol_reset%
set game.snakeHead=%fullcol_blue%%game.block%%fullcol_reset%
set game.snakeBody=%fullcol_aqua%%game.block%%fullcol_reset%
set game.apple=%fullcol_dred%%game.block%%fullcol_reset%

::character
set promptIcon="> "
set root=root4dNsVde6

::heading nigga
set "snakeShortLine1= _____                _         "
set "snakeShortLine2=/  ___|              | |        "
set "snakeShortLine3=\ `--.  _ __    __ _ | | __ ___ "
set "snakeShortLine4= `--. \| '_ \  / _` || |/ // _ \"
set "snakeShortLine5=/\__/ /| | | || (_| ||   <|  __/"
set "snakeShortLine6=\____/ |_| |_| \__,_||_|\_\\___|"

set "snakeLine1= _____                _             _               ______  _   _   ___  "
set "snakeLine2=/  ___|              | |           | |              |  _  \| \ | | / _ \ "
set "snakeLine3=\ `--.  _ __    __ _ | | __ ___    | |__   _   _    | | | ||  \| |/ /_\ \"
set "snakeLine4= `--. \| '_ \  / _` || |/ // _ \   | '_ \ | | | |   | | | || . ` ||  _  |"
set "snakeLine5=/\__/ /| | | || (_| ||   <|  __/   | |_) || |_| |   | |/ / | |\  || | | |"
set "snakeLine6=\____/ |_| |_| \__,_||_|\_\\___|   |_.__/  \__, |   |___/  \_| \_/\_| |_/"
set "snakeLine7=                                            __/ |                        "
set "snakeLine8=                                           |___/                         "