changequote(`{{', `}}')dnl
define({{GO}}, {{function {{__}}GO_CMD:$1()}})dnl
define({{BLOCK}}, {{( set -ex $1)}})dnl
define({{FILE}}, {{cat << 'EOF' > $1 $2
EOF
}})dnl
