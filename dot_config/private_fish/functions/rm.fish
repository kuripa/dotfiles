function rm --wraps=rm --description 'safer rm with -i by default'
    command rm -i $argv
end
