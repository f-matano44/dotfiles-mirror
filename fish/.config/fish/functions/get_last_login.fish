function get_last_login
    LANG=C last -R "$USER" | awk '\
        $7 != "gone" && $7 != "still" && $8 != "still" \
        { print $3, $4, $5, $6, $9; exit }'
end
