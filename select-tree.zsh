#!/bin/zsh

# treeで色々実行したいときとかあるかもね
# 括弧とかスペースとか置き換えないと気持ちわるい。

function percol_tree() {
	selected=$(tree -f | percol --match-method migemo)
	local new_left="${LBUFFER} ${selected##* }"
	BUFFER=${new_left}$RBUFFER
	CURSOR=${#new_left}
	zle reset-prompt
}
zle -N percol_tree

bindkey '^ti' percol_tree