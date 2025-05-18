#!/bin/sh

cat <<EOF >> ~/.bashrc

## BEGIN of autocomplete block
cdansible() {
  cd ~/git/"\$1"
}

_cdansible_complete() {
  local cur="\${COMP_WORDS[COMP_CWORD]}"
  local basedir=~/git
  local matches=\$(compgen -W "\$(ls -1d \${basedir}/ansible*/ 2>/dev/null | xargs -n1 basename)" -- "\$cur")
  COMPREPLY=( \$matches )
}

complete -F _cdansible_complete cdansible


cdterraform() {
  cd ~/git/"\$1"
}

_cdterraform_complete() {
  local cur="\${COMP_WORDS[COMP_CWORD]}"
  local basedir=~/git
  local matches=\$(compgen -W "\$(ls -1d \${basedir}/terraform*/ 2>/dev/null | xargs -n1 basename)" -- "\$cur")
  COMPREPLY=( \$matches )
}

complete -F _cdterraform_complete cdterraform


cddocker() {
  cd ~/"\$1"
}

_cddocker_complete() {
  local cur="\${COMP_WORDS[COMP_CWORD]}"
  local basedir=~/
  local matches=\$(compgen -W "\$(ls -1d \${basedir}/docker*/ 2>/dev/null | xargs -n1 basename)" -- "\$cur")
  COMPREPLY=( \$matches )
}

complete -F _cddocker_complete cddocker


cdkia() {
  cd ~/git/kiamol/"\$1"
}

_cdkia_complete() {
  local cur="\${COMP_WORDS[COMP_CWORD]}"
  local basedir=~/git/kiamol
  local matches=\$(compgen -W "\$(ls -1d \${basedir}/*/ 2>/dev/null | xargs -n1 basename)" -- "\$cur")
  COMPREPLY=( \$matches )
}

complete -F _cdkia_complete cdkia
