function add_user_a () {
    echo 'Adding virual user A'
    local user_home="$FTP_USER_HOME/$VIRTUAL_USER_A"
    mkdir -p "$user_home"

    local passwd_file="$(mktemp)"
    echo "$VIRTUAL_USER_A_PASSWORD
$VIRTUAL_USER_A_PASSWORD" > "$passwd_file"
    pure-pw useradd "$VIRTUAL_USER_A" -f "$PURE_PASSWDFILE" -m -u $FTP_USER_NAME -d "$user_home" < "$passwd_file" > /dev/null
}


function add_user_b () {
    echo 'Adding virual user B'
    local user_home="$FTP_USER_HOME/$VIRTUAL_USER_B"
    mkdir -p "$user_home"

    local passwd_file="$(mktemp)"
    echo "$VIRTUAL_USER_B_PASSWORD
$VIRTUAL_USER_B_PASSWORD" > "$passwd_file"
    pure-pw useradd "$VIRTUAL_USER_B" -f "$PURE_PASSWDFILE" -m -u $FTP_USER_NAME -d "$user_home" < "$passwd_file" > /dev/null
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    add_user_a
    add_user_b
    /run.sh -l puredb:"$PURE_DBFILE" -E -j -R -P $PUBLICHOST
fi
