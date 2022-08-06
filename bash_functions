

resetcard() {
    rm -r ~/.gnupg/private-keys-v1.d
    gpgconf --kill gpg-agent
    gpg --card-status
}

function lg
{

read -d '' DATA << __EOF__

-----BEGIN PGP MESSAGE-----
Comment: GPGTools - https://gpgtools.org

hQIMA33dgLuA5dX+AQ//eQq+/Mt33EtvY+i+ne6lQdEjRs4xtNDDb6gz6b4DThoB
a3JKM2EtBoRSpe6s1/t2vbJA1oqbYmGrbPfjR+rCY2gN/sBJ/0XxYGs9rHarwtqD
89TVMYPefmB3U3fW6tNyuXrzZP4z8KkjmUGAXQtF2lR2jqo+FaZjbiD7x44C92KR
AVaAvGuRQqrABN1RTkDnHwOuERHrHiQwOL0V0k8UlqyQ/R75yhH4lHPr+YoWiGVo
+PeMK6Sj6+EoshlL0HnrAB67qrbzYGP9ra2rJKtDRz0+JV5MP3N/2VOYA+dRt8Q/
c1/luPgmpGbLIJAvEGT02xpb8UCgoucEHdmDU/psBIZr5eB8Ztxz1oUEupmm4QNN
EkxadzqLXVnILWdie3g2lzTgT7lRhJlWd8gVsO/bOM3kbiU+WzPHSUeBPdGaBf4m
feifjG8VM5fW9KRLEFTITTo3V4PUxOYVL/Imw29UPpFtH/UEknFiPCBa/8C167gj
ppXm35g18IncZ9V/V0dgMbe+Y46+aU7hKAM8rxl1KWv9uFR5ZTcQ8+1O9Qk9HbfN
d6igpmzLqq9f5V4v9ZnkmCH9HmODDtiry4jU9fVu2zT28SRm2kpwqh7gfwLMCnLa
poD8SX8dVKKkOxVCrJYBdS+8JFoCrxIsqIBLc7Nmwik1DQ/jNejxUBthvyGMX+nS
SgF5S+kIS52oEBTkyoWdBav6X5OzPP/AFBO0vzRxW7Rn/CswENDK3WcSke0076Js
i/y6aXbYatU7HgtfXsq77mTTLrMgu5iLrb6L
=Vyo3
-----END PGP MESSAGE-----

__EOF__

gpg --card-status >/dev/null
gpg -d <(echo $DATA) 2> /dev/null

}

ipp ()
{
    if [[ -z '${VIRTUAL_ENV}' ]] || [[ $VIRTUAL_ENV != /home/james/.local/python/python3.9 ]]
    then
       source ~/.local/python/python3.9/bin/activate
    fi
    ipython "$@"
}

function fu {
    if [ -z "$(mount |grep /home/james/mnt)" ]
    then
        echo mounting
        sshfs hv2:tmp ~/mnt
    else
        echo un-mounting
        fusermount -u $HOME/mnt
    fi
}

