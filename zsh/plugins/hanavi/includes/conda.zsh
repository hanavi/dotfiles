# Conda

[[ -n "$_HANAVI_DEBUG" ]] && echo "loading conda config"

alias c='conda'
alias ci='conda install'
alias ciy='conda install -y'
alias cel="conda env list"

caw() {
    conda deactivate
    conda activate working
}

ca() {
    conda deactivate
    conda activate "$@"
}

ipy() {
    [[ "$CONDA_DEFAULT_ENV" = "base" ]] && conda deactivate && conda activate working
    ipython "$@"
}

ccr() {
    local envname=$1
    [[ -z "$envname" ]] && echo "Usage: ccr new-env-name" && return 1
    if ( conda env list | grep -q "$envname" ) ; then
        while true; do

            read "?Environment exists... Are you sure you want to continue? [yn] " check

            case "$check" in
                y|yes|Y|Yes|YES)
                    conda deactivate
                    conda env remove -y -n "$envname"
                    break
                    ;;
                n|no|N|No|NO)
                    return 1
                    ;;
                *)
                    printf "Invalid option!\n"
            esac
        done
    fi
    conda deactivate
    conda create -y -n "$envname"
    conda activate "$envname"
}
