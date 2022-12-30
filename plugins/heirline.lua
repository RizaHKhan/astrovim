return function(config)
  -- disable lsp progress
  config[1][9] = astronvim.status.component.lsp { lsp_progress = false }
  -- disable close button in bufferline tabs
  config[3][2] =
    astronvim.status.heirline.make_buflist(astronvim.status.component.tabline_file_info { close_button = false })

  return config
end