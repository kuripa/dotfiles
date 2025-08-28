function extract
    set -l file $argv[1]

    if test -z "$file"
        gum style --foreground 1 "❌ Bitte gib eine Datei zum Entpacken an."
        return 1
    end

    if not test -f "$file"
        gum style --foreground 1 "❌ Datei '$file' existiert nicht."
        return 1
    end

    # Zielverzeichnis
    set -l dest_dir (basename $file | sed 's/\.[^.]*$//')

    gum style --border rounded --padding "1 2" --foreground 33 --border-foreground 62 "📦 Entpacke: $file → $dest_dir"

    mkdir -p "$dest_dir"
    cd "$dest_dir" || return 1

    set -l success 0

    switch (string lower $file)
        case '*.zip'
            set -l encrypted (unzip -t "../$file" 2>&1 | grep -i 'encrypted')
            if test -n "$encrypted"
                set -l password (gum input --password --prompt "🔑 Passwort für ZIP:")
                unzip -P "$password" "../$file"
            else
                unzip "../$file"
            end
            set success $status

        case '*.rar'
            set -l encrypted (unrar lt -p- "../$file" 2>&1 | grep -i 'encrypted\|password')
            if test -n "$encrypted"
                set -l password (gum input --password --prompt "🔑 Passwort für RAR:")
                unrar x -p"$password" "../$file"
            else
                unrar x -p- "../$file"
            end
            set success $status

        case '*.7z'
            set -l encrypted (7z l "../$file" 2>&1 | grep -i 'encrypted\|password')
            if test -n "$encrypted"
                set -l password (gum input --password --prompt "🔑 Passwort für 7z:")
                7z x -p"$password" "../$file"
            else
                7z x "../$file"
            end
            set success $status

        case '*.tar'
            tar -xf "../$file"
            set success $status
        case '*.tar.gz' '*.tgz'
            tar -xzf "../$file"
            set success $status
        case '*.tar.bz2'
            tar -xjf "../$file"
            set success $status
        case '*.tar.xz'
            tar -xJf "../$file"
            set success $status

        case '*'
            gum style --foreground 1 "❌ Unbekanntes Archivformat: $file"
            cd ..
            rm -rf "$dest_dir"
            return 1
    end

    if test $success -eq 0
        gum style --foreground 10 "✅ Erfolgreich entpackt nach: $dest_dir"
    else
        gum style --foreground 1 "❌ Entpacken fehlgeschlagen! Falsches Passwort oder beschädigtes Archiv."
        cd ..
        rm -rf "$dest_dir"
        return 1
    end
end
