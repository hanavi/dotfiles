# Conda

[ -n "$_HANAVI_DEBUG" ] && echo "loading conda config"

alias c='conda'
alias ci='conda install'

caw() {
    conda deactivate
    conda activate working
}

ca() {
    conda deactivate
    conda activate "$@"
}

ipy() {
    [ "$CONDA_DEFAULT_ENV" = "base" ] && conda deactivate && conda activate working
    ipython "$@"
}
