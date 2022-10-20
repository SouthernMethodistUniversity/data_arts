always_load("singularity")

local img_name      = 'data_arts_latest-2022-10-18-ed1c9abbc1e4.simg'
local img_directory = '/hpc/applications/containers/'
local img_path      = pathJoin(img_directory, img_name)

function build_command(cmd)
  local cmd_beginning = 'singularity exec '
  local cmd_ending    = img_path .. ' ' .. cmd
  local sh_ending     = ' "$@"'
  local csh_ending    = ' $*'
  local sh_cmd        = cmd_beginning .. cmd_ending .. sh_ending
  local csh_cmd       = cmd_beginning .. cmd_ending .. csh_ending
  set_shell_function(cmd, sh_cmd, csh_cmd)
end

build_command('python3')
build_command('jupyter')
build_command('jupyter-lab')

