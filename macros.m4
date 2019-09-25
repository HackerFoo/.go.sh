dnl name confusing strings
dnl
define(`OPENBRACE', `{')dnl
define(`CLOSEBRACE', `}')dnl
define(`OPENPAREN', `(')dnl
define(`CLOSEPAREN', `)')dnl
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
dnl wrap Python into a go function
define({{GOPY}}, {{__END}}
{{define({{__END}}, {{__END_PYTHON}})d}}{{nl}}
{{function {{__}}GO_CMD:$1()}}OPENBRACE
{{python <{{}}OPENPAREN{{}}cat << EOF
if True:}})dnl
dnl
dnl end of a Python wrapper
define({{__END_PYTHON}}, {{
EOF
CLOSEPAREN
CLOSEBRACE}})dnl
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
dnl
dnl format is a common identifier, so undefine m4's format
undefine({{format}})dnl
