# My Profile....
del alias:gl -Force
del alias:gp -Force
del alias:sp -Force

Set-Alias -Name a -Value venv\Scripts\activate
Set-Alias -Name act -Value venv\Scripts\activate
Set-Alias -Name activate -Value venv\Scripts\activate

Set-Alias -Name grep -Value findstr

function gst {git status $args}
function ga {git add $args}
function gc {git commit $args}
function gcmsg {git commit -m $args}
function g {git $args}
function gp {git push $args}
function gl {git pull $args}
function gd {git diff $args | more}
function gdt {git difftool $args}
#function glog {git log | more}

function home {set-location c:\users\t70995}
function pp {set-location c:\users\t70995\PycharmProjects}
function docs {set-location c:\users\t70995\Documents}
function dl {set-location c:\users\t70995\Downloads}
function tet {set-location c:\users\t70995\PycharmProjects\tetration}

function d {vimdiff $args}
function p {putty $args}
function pl {putty -load $args}
function sftp {psftp $args}
function stet {putty -load tetration}
function sp {. $profile}
function ep {gvim $profile}
function n {notepad $args}
#function bne {py ..\test\bit9_send_email.py}
function bnc {py c:\users\t70995\PycharmProjects\test\bit9_check_email.py}
function pk {pageant $home\putty\putty_key.ppk}

# Fix python cache issue for bit9 bypass email checker script
function ccache {c:\users\t70995\PycharmProjects\test\clear_cache.py}

function glg { git log --stat }
function glgp { git log --stat -p }
function glgg { git log --graph }
function glgga { git log --graph --decorate --all }
function glgm { git log --graph --max-count=10 }
function glo { git log --oneline --decorate }
function glol { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' }
function glols { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat }
function glod { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' }
function glods { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short }
function glola { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all }
function glog { git log --oneline --decorate --graph }
function gloga { git log --oneline --decorate --graph --all  }
