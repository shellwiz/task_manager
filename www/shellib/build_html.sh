#!/usr/bin/awk -f 

/awk\$[0-9]+/{
    for (i = 2; i < ARGC; i++) {
        n=i-1
        gsub("awk\$"n, ARGV[i]);
    }
}

/^ *EXECUTE/{
    gsub($2, "\""ENVIRON["DIR_EXEC"]"/"$2"\"")
    gsub(/^ *EXECUTE */, "")
    system($0);
    next;
}

/^ *INCLUDE_HTML/{
    gsub($2, ENVIRON["BUILD_HTML"]" \""ENVIRON["DIR_WEB"]"/"$2".html\"")
    gsub(/^ *INCLUDE_HTML */, "")
    system($0);
    next;
}

//{
    print ;
}
