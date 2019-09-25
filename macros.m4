dnl name confusing strings
dnl
define(`OPENBRACE', `{')dnl
define(`CLOSEBRACE', `}')dnl
dnl
dnl switch to {{ }}
changequote(`{{', `}}')dnl
dnl
dnl macros to close braces
define({{__END}}, )dnl
dnl
dnl declare top level stuff
define({{DECLARE}}, {{__END}}
{{define({{__END}}, )d}}{{nl}})dnl
dnl
dnl declare a go function
define({{GO}}, {{__END}}
{{define({{__END}}, CLOSEBRACE)d}}{{nl}}
{{function {{__}}GO_CMD:$1()}}OPENBRACE)dnl
dnl
dnl blocks for running in a set -ex process
define({{BLOCK}}, {{( set -ex $1)}})dnl
dnl
dnl functions for including inline files
dnl FILE_VAR allows bash variables
define({{FILE}}, {{cat << 'EOF' > $1 $2
EOF
}})dnl
dnl
define({{FILE_VAR}}, {{cat << EOF > $1 $2
EOF
}})dnl
dnl
dnl temporarily change shell options
define({{WITH_SHOPT}},
       {{__shopts={{$}}{BASHOPTS}
         shopt -s $1
         $2
         shopt -u $1
         shopt -s {{$}}{__shopts//:/ }
         unset __shopts;}})dnl
dnl
dnl call a go function
define({{GO_CALL}}, {{__}}GO_CMD:$1)dnl
