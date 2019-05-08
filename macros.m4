changequote(`{{', `}}')dnl
define({{GO}}, {{function {{__}}GO_CMD:$1()}})dnl
define({{BLOCK}}, {{( set -ex $1)}})dnl
define({{FILE}}, {{cat << 'EOF' > $1 $2
EOF
}})dnl
define({{FILE_VAR}}, {{cat << EOF > $1 $2
EOF
}})dnl
define({{WITH_SHOPT}},
       {{__shopts={{$}}{BASHOPTS}
         shopt -s $1
         $2
         shopt -u $1
         shopt -s {{$}}{__shopts//:/ }
         unset __shopts;}})dnl
