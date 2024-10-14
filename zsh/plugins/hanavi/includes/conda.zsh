# Conda

[ -n "$_HANAVI_DEBUG" ] && echo "loading conda config"

caw() {
    conda deactivate
    conda activate working
}

alias c='conda'
alias ci='conda install'
alias ca='conda activate'

function ipy {
    [ "$CONDA_DEFAULT_ENV" = "base" ] && conda deactivate && conda activate working
    ipython "$@"
}
