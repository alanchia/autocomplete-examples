#!/bin/sh

cat <<EOF >> ~/.bashrc
cdansible() {
  cd ~/git/"$1"
}

_cdansible_complete() {
  local cur="\${COMP_WORDS[COMP_CWORD]}"
  local basedir=~/git

  # Get only matching dirs that start with "ansible"
  local matches=\$(compgen -W "\$(ls -1d \${basedir}/ansible*/ 2>/dev/null | xargs -n1 basename)" -- "\$cur")

  COMPREPLY=( \$matches )
}

complete -F _cdansible_complete cdansible


cdterraform() {
  cd ~/git/"$1"
}

_cdterraform_complete() {
  local cur="\${COMP_WORDS[COMP_CWORD]}"
  local basedir=~/git

  local matches=\$(compgen -W "\$(ls -1d \${basedir}/terraform*/ 2>/dev/null | xargs -n1 basename)" -- "\$cur")
  COMPREPLY=( \$matches )
}

complete -F _cdterraform_complete cdterraform
EOF
