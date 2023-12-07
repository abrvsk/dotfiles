-- enable sneak colour change
-- vim.cmd('hi! link Sneak Search')

-- vim.g['sneak#label'] = 1

-- ignore case based on default setting
-- vim.g['sneak#use_ic_scs'] = 1

require('hop').setup {}

-- vim.cmd('autocmd filetype netrw nunmap <buffer>s')
vim.keymap.set('n', 's', ':HopChar2<cr>')
vim.keymap.set('n', '<leader>j', ':HopChar2<cr>')

function map_netrw_key(key)
    local expanded_map = vim.fn.maparg(key, 'n')
    if #expanded_map == 0 or expanded_map:match('_Net\\|FileBeagle') then
        if #expanded_map > 0 then
            -- else, mapped to <nop>
            vim.fn.execute((expanded_map:match('<Plug>') and 'nmap' or 'nnoremap') ..
                ' <buffer> <silent> <leader>' .. key .. ' ' .. expanded_map)
        end
        -- unmap the default buffer-local mapping to allow hop's global mapping.
        vim.fn.execute('nunmap <buffer> ' .. key)
    end
end

vim.cmd([[
    augroup hop_netrw
      autocmd!
      autocmd FileType netrw,filebeagle autocmd hop_netrw CursorMoved <buffer>
              \ call v:lua.map_netrw_key('s') | call v:lua.map_netrw_key('S') | autocmd! hop_netrw * <buffer>
    augroup END
  ]])
