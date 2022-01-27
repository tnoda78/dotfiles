"p分割した設定ファイルを読み込み
source ~/dotfiles/vimrc.plug
source ~/dotfiles/vimrc.basic
source ~/dotfiles/vimrc.indent
source ~/dotfiles/vimrc.search
source ~/dotfiles/vimrc.encoding
source ~/dotfiles/vimrc.moving
source ~/dotfiles/vimrc.apperance
source ~/dotfiles/vimrc.editing
source ~/dotfiles/vimrc.ctrlp
source ~/dotfiles/vimrc.vim-go
source ~/dotfiles/vimrc.rust
source ~/dotfiles/vimrc.vue

" if executable('gopls')
"   augroup LspGo
"     au!
"     autocmd User lsp_setup call lsp#register_server({
"         \ 'name': 'go-lang',
"         \ 'cmd': {server_info->['gopls']},
"         \ 'whitelist': ['go'],
"         \ 'workspace_config': {'gopls': {
"         \     'staticcheck': v:true,
"         \     'completeUnimported': v:true,
"         \     'caseSensitiveCompletion': v:true,
"         \     'usePlaceholders': v:true,
"         \     'completionDocumentation': v:true,
"         \     'watchFileChanges': v:true,
"         \     'hoverKind': 'SingleLine',
"         \   }},
"         \ })
"     autocmd FileType go setlocal omnifunc=lsp#complete
"     autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
"     autocmd FileType go nmap <buffer> ,n <plug>(lsp-next-error)
"     autocmd FileType go nmap <buffer> ,p <plug>(lsp-previous-error)
"   augroup END
" 
"   let g:lsp_log_file = expand('~/vim-lsp.log')
" endif
" 
" if executable('rls')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'rls',
"         \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
"         \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
"         \ 'whitelist': ['rust'],
"         \ })
" endif
