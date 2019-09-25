divert(-1)
# ^ don't echo newlines and comments from these definitions

# name confusing strings
define(`OPENBRACE', `{')
define(`CLOSEBRACE', `}')
define(`OPENPAREN', `(')
define(`CLOSEPAREN', `)')

# switch to {{ }}
changequote(`{{', `}}')

# macros to close braces
define({{__END}}, )

# declare top level stuff
define({{DECLARE}}, {{__END}}
{{define({{__END}}, )d}}{{nl}})

# declare a go function
define({{GO}}, {{__END}}
{{define({{__END}}, CLOSEBRACE)d}}{{nl}}
{{function {{__}}GO_CMD:$1()}}OPENBRACE)

# wrap Python into a go function
define({{GOPY}}, {{__END}}
{{define({{__END}}, {{__END_PYTHON}})d}}{{nl}}
{{function {{__}}GO_CMD:$1()}}OPENBRACE
{{python <{{}}OPENPAREN{{}}cat << 'EOF'
def go(argv):}})

# end of a Python wrapper
define({{__END_PYTHON}}, {{
EOF
echo "go(\"${{}}@\".split())"
CLOSEPAREN
CLOSEBRACE}})

# blocks for running in a set -ex process
define({{BLOCK}}, {{( set -ex $1)}})

# functions for including inline files
# FILE_VAR allows bash variables
define({{FILE}}, {{cat << 'EOF' > $1 $2
EOF
}})

define({{FILE_VAR}}, {{cat << EOF > $1 $2
EOF
}})

# temporarily change shell options
define({{WITH_SHOPT}},
       {{__shopts={{$}}{BASHOPTS}
         shopt -s $1
         $2
         shopt -u $1
         shopt -s {{$}}{__shopts//:/ }
         unset __shopts;}})

# call a go function
define({{GO_CALL}}, {{__}}GO_CMD:$1)

# format is a common identifier, so undefine m4's format
undefine({{format}})

# close remaining braces
m4wrap({{__END}})

# end
divert(0)dnl
