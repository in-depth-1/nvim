local M = {}

function M.config()
  -- do nothing
end

function M.setup()
  local status, telescope = pcall(require, 'telescope')
  if not status then
    vim.notify('telescope 没有加载或未安装')
    return
  end
  telescope.load_extension('media_files')
  local actions = require('telescope.actions')
  local setting = {
    defaults = {
      prompt_prefix = '🔍 ',
      selection_caret = ' ',
      path_display = { 'smart' },

      mappings = {
        i = {
          -- 切换历史搜索
          ['<C-n>'] = actions.cycle_history_next,
          ['<C-p>'] = actions.cycle_history_prev,
          -- 文件移动
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
          ['<Down>'] = actions.move_selection_next,
          ['<Up>'] = actions.move_selection_previous,
          -- 关闭窗口
          ['<leader>c'] = actions.close,
          -- 打开文件
          ['<CR>'] = actions.select_default,
          ['<C-x>'] = actions.select_horizontal,
          ['<C-v>'] = actions.select_vertical,
          ['<C-t>'] = actions.select_tab,
          -- 预览窗口移动
          ['<C-u>'] = actions.preview_scrolling_up,
          ['<C-d>'] = actions.preview_scrolling_down,
          -- 文件窗口移动
          ['<PageUp>'] = actions.results_scrolling_up,
          ['<PageDown>'] = actions.results_scrolling_down,
          -- qflist
          ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
          ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
          ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
          ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
          ['<C-l>'] = actions.complete_tag,
          -- wichkey
          ['<C-_>'] = actions.which_key, -- keys from pressing <C-/>
        },
        n = {
          ['<esc>'] = actions.close,
          ['<CR>'] = actions.select_default,
          ['<C-x>'] = actions.select_horizontal,
          ['<C-v>'] = actions.select_vertical,
          ['<C-t>'] = actions.select_tab,
          ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
          ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
          ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
          ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
          ['j'] = actions.move_selection_next,
          ['k'] = actions.move_selection_previous,
          ['H'] = actions.move_to_top,
          ['M'] = actions.move_to_middle,
          ['L'] = actions.move_to_bottom,
          ['<Down>'] = actions.move_selection_next,
          ['<Up>'] = actions.move_selection_previous,
          ['gg'] = actions.move_to_top,
          ['G'] = actions.move_to_bottom,
          ['<C-u>'] = actions.preview_scrolling_up,
          ['<C-d>'] = actions.preview_scrolling_down,
          ['<PageUp>'] = actions.results_scrolling_up,
          ['<PageDown>'] = actions.results_scrolling_down,
          ['?'] = actions.which_key,
        },
      },
    },
    pickers = {
      find_files = {
        theme = 'dropdown',
      },
      current_buffer_fuzzy_find = {
        theme = 'dropdown',
      },
      live_grep = {
        theme = 'dropdown',
      },
      oldfiles = {
        theme = 'dropdown',
      },
      git_status = {
        theme = 'dropdown',
      },
    },
    extensions = {
      media_files = {
        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        filetypes = { "png", "webp", "jpg", "jpeg", "pdf", "mp4" },
        find_cmd = "rg"
      }
    },
  }

  ---@diagnostic disable-next-line: redundant-parameter
  telescope.setup(setting)
end

return M
