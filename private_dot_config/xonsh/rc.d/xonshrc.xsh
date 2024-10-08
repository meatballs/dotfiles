$PYTEST_ADDOPTS="--pdbcls pudb.debugger:Debugger --capture=no"
$EDITOR = "nvim"
$VI_MODE = True
$DOCKER_BUILDKIT = 1
$BAT_THEME = "Nord"
__xonsh__.commands_cache.threadable_predictors["glances"] = lambda x: False
execx($(starship init xonsh))
execx($(zoxide init --cmd cd xonsh), 'exec', __xonsh__.ctx, filename='zoxide')
