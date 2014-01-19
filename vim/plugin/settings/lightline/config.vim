" Lightline.vim Configuration

let g:lightline = {
\   'colorscheme': 'jellybeans',
\   'active': {
\     'left': [
\       [ 'mode', 'paste' ],
\       [ 'fugitive', 'ctrlp', 'filename' ]
\     ],
\     'right': [
\       [ 'syntastic', 'lineinfo' ],
\       ['percent'],
\       [ 'fileformat', 'fileencoding', 'filetype' ]
\     ]
\   },
\   'component_function': {
\     'readonly': 'LightlineReadonly',
\     'modified': 'LightlineModified',
\     'fugitive': 'LightlineFugitive',
\     'filename': 'LightlineFilename',
\     'fileformat': 'LightlineFileformat',
\     'filetype': 'LightlineFiletype',
\     'fileencoding': 'LightlineFileencoding',
\     'ctrlp': 'LightlineCtrlP',
\     'mode': 'LightlineMode'
\   },
\   'component_expand': {
\     'syntastic': 'SyntasticStatuslineFlag'
\   },
\   'component_type': {
\     'syntastic': 'error'
\   },
\   'component': {
\     'lineinfo': '⭡%3l:%-2v'
\   },
\   'separator': {
\     'left': '⮀',
\     'right': '⮂'
\   },
\   'subseparator': {
\     'left': '⮁',
\     'right': '⮃'
\   }
\ }
