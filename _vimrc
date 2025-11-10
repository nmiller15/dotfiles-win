set relativenumber

let mapleader = "<Space>"

" Show line numbers
set number

set visualbell
set scrolloff=10

" Highlight yanked text
let g:highlightedyank_highlight_duration = 500

" Remappings
nnoremap <Leader>e :vsc View.SolutionExplorer<CR>
nnoremap <Leader>sf :vsc Edit.GoToAll<CR>
nnoremap <Leader>sl :vsc Debug.Locals<CR>
nnoremap <Leader>sd :vsc View.ErrorList<CR>
nnoremap <Leader>sk :vsc Tools.CustomizeKeyboard<CR>
nnoremap <Leader>st :vsc TestExplorer.ShowTestExplorer<CR>
nnoremap <Leader>so :source ~\_vimrc<CR>:echo "_vimrc sourced..."<CR>
nnoremap <Leader>gs :vsc Team.Git.GoToGitChanges<CR>
nnoremap <Leader>sh :vsc Edit.QuickInfo<CR>
nnoremap <Leader>r :redo<CR>
nnoremap <Leader>gu :vsc View.Github.Copilot.Chat<CR>
xnoremap <Leader>p "_dP

nnoremap grd :vsc Edit.GoToDefinition<CR>
nnoremap gri :vsc Edit.GoToImplementation<CR>

nnoremap gcc :vsc Edit.ToggleLineComment<CR>
vnoremap gc :vsc Edit.ToggleLineComment<CR>
