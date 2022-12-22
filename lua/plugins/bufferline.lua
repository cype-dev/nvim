require('bufferline').setup {
  options = {
    diagnostics = 'nvim_lsp',
    show_buffer_close_icons = true,
    hover = {
      enabled = true,
      delay = 200,
      reveal = {'close'}
    },
    right_mouse_command = '', -- Disable rightclick
    middle_mouse_command = 'bdelete %d', -- Use MMB to close buffer
    diagnostics_indicator = function(count, level, _, _)
      local icon = level:match 'error' and ' ' or ' '
      return ' ' .. icon .. count
    end,
    separator_style = 'slant',
  },
  -- Highlights if using transparent background
  highlights = {
    fill = {
      bg = {
        attribute = 'bg',
        highlight = 'BufferlineBackgroundColor'
      }
    },
    background = {
      bg = {
        attribute = 'bg',
        highlight = 'BufferlineInactiveColor'
      }
    },
    separator = {
      fg = {
        attribute = 'bg',
        highlight = 'BufferlineBackgroundColor'
      },
      bg = {
        attribute = 'bg',
        highlight = 'BufferlineInactiveColor'
      }
    },
    separator_selected = {
      fg = {
        attribute = 'bg',
        highlight = 'BufferlineBackgroundColor'
      },
    },
    modified = {
      bg = {
        attribute = 'bg',
        highlight = 'BufferlineInactiveColor'
      }
    },
    error = {
      bg = {
        attribute = 'bg',
        highlight = 'BufferlineInactiveColor'
      }
    },
    error_diagnostic = {
      bg = {
        attribute = 'bg',
        highlight = 'BufferlineInactiveColor'
      }
    },
    warning = {
      bg = {
        attribute = 'bg',
        highlight = 'BufferlineInactiveColor'
      }
    },
    warning_diagnostic = {
      bg = {
        attribute = 'bg',
        highlight = 'BufferlineInactiveColor'
      }
    },
    info = {
      bg = {
        attribute = 'bg',
        highlight = 'BufferlineInactiveColor'
      }
    },
    info_diagnostic = {
      bg = {
        attribute = 'bg',
        highlight = 'BufferlineInactiveColor'
      }
    },
    hint = {
      bg = {
        attribute = 'bg',
        highlight = 'BufferlineInactiveColor'
      }
    },
    hint_diagnostic = {
      bg = {
        attribute = 'bg',
        highlight = 'BufferlineInactiveColor'
      }
    },
    separator_visible = {
      fg = {
        attribute = 'bg',
        highlight = 'BufferlineBackgroundColor'
      },
      bg = {
        attribute = 'bg',
        highlight = 'Normal'
      }
    },
    close_button = {
      bg = {
        attribute = 'bg',
        highlight = 'BufferlineInactiveColor'
      }
    },
  }
}

