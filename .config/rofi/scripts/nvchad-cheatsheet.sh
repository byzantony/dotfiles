#!/bin/bash
# NvChad Keybinding Cheatsheet — searchable via rofi

CHEATSHEET=$(cat <<'EOF'
[GENERAL] toggle relative number ··· <leader> + rn
[GENERAL] window right ··· <C-l>
[GENERAL] move down ··· j
[GENERAL] window down ··· <C-j>
[GENERAL] mapping cheatsheet ··· <leader> + ch
[GENERAL] new buffer ··· <leader> + b
[GENERAL] save file ··· <C-s>
[GENERAL] move down ··· <Down>
[GENERAL] window up ··· <C-k>
[GENERAL] copy whole file ··· <C-c>
[GENERAL] move up ··· <Up>
[GENERAL] clear highlights ··· <Esc>
[GENERAL] toggle line number ··· <leader> + n
[GENERAL] window left ··· <C-h>
[GENERAL] move up ··· k
[GENERAL (i)] beginning of line ··· <C-b>
[GENERAL (i)] move right ··· <C-l>
[GENERAL (i)] end of line ··· <C-e>
[GENERAL (i)] move down ··· <C-j>
[GENERAL (i)] move left ··· <C-h>
[GENERAL (i)] move up ··· <C-k>
[GENERAL (t)] escape terminal mode ··· <C-x>
[GENERAL (v)] move up ··· <Up>
[GENERAL (v)] move down ··· <Down>
[GENERAL (x)] dont copy replaced text ··· p
[GENERAL (x)] move up ··· k
[GENERAL (x)] move down ··· j
[BLANKLINE] jump to current context ··· <leader> + cc
[COMMENT] toggle comment ··· <leader> + /
[COMMENT (v)] toggle comment ··· <leader> + /
[GITSIGNS] reset hunk ··· <leader> + rh
[GITSIGNS] jump to next hunk ··· ]c
[GITSIGNS] preview hunk ··· <leader> + ph
[GITSIGNS] toggle deleted ··· <leader> + td
[GITSIGNS] jump to prev hunk ··· [c
[GITSIGNS] blame line ··· <leader> + gb
[LSPCONFIG] lsp references ··· gr
[LSPCONFIG] floating diagnostic ··· <leader> + f
[LSPCONFIG] add workspace folder ··· <leader> + wa
[LSPCONFIG] lsp declaration ··· gD
[LSPCONFIG] remove workspace folder ··· <leader> + wr
[LSPCONFIG] goto next ··· ]d
[LSPCONFIG] diagnostic setloclist ··· <leader> + q
[LSPCONFIG] lsp hover ··· K
[LSPCONFIG] lsp formatting ··· <leader> + fm
[LSPCONFIG] lsp implementation ··· gi
[LSPCONFIG] lsp signature help ··· <leader> + ls
[LSPCONFIG] lsp definition type ··· <leader> + D
[LSPCONFIG] list workspace folders ··· <leader> + wl
[LSPCONFIG] lsp rename ··· <leader> + ra
[LSPCONFIG] lsp definition ··· gd
[LSPCONFIG] goto prev ··· [d
[LSPCONFIG] lsp code action ··· <leader> + ca
[NVIMTREE] focus nvimtree ··· <leader> + e
[NVIMTREE] toggle nvimtree ··· <C-n>
[NVTERM] toggle vertical term ··· <A-v>
[NVTERM] toggle floating term ··· <A-i>
[NVTERM] new horizontal term ··· <leader> + h
[NVTERM] toggle horizontal term ··· <A-h>
[NVTERM] new vertical term ··· <leader> + v
[NVTERM (t)] toggle vertical term ··· <A-v>
[NVTERM (t)] toggle horizontal term ··· <A-h>
[NVTERM (t)] toggle floating term ··· <A-i>
[TABUFLINE] close buffer ··· <leader> + x
[TABUFLINE] goto next buffer ··· <tab>
[TABUFLINE] goto prev buffer ··· <S-tab>
[TELESCOPE] git status ··· <leader> + gt
[TELESCOPE] find buffers ··· <leader> + fb
[TELESCOPE] pick hidden term ··· <leader> + pt
[TELESCOPE] help page ··· <leader> + fh
[TELESCOPE] nvchad themes ··· <leader> + th
[TELESCOPE] find oldfiles ··· <leader> + fo
[TELESCOPE] find files ··· <leader> + ff
[TELESCOPE] find in current buffer ··· <leader> + fz
[TELESCOPE] find all ··· <leader> + fa
[TELESCOPE] git commits ··· <leader> + cm
[TELESCOPE] live grep ··· <leader> + fw
[WHICHKEY] which-key query lookup ··· <leader> + wk
[WHICHKEY] which-key all keymaps ··· <leader> + wK
EOF
)

rofi -dmenu \
    -p "NvChad" \
    -i \
    -no-custom \
    -format 'd' \
    -theme-str 'window {width: 900px; height: 700px;}' \
    -theme-str 'listview {lines: 20;}' \
    -theme-str 'element-text {font: "JetBrainsMono Nerd Font 11";}' \
    -theme-str 'inputbar {font: "JetBrainsMono Nerd Font 12";}' \
    <<< "$CHEATSHEET"

