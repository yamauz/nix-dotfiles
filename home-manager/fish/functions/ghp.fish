# PRピッカー: 自分のPR(ドラフト含む)→レビュー待ちPRをユーザー順に表示し、
# fzfで選択して Enter: チェックアウト / ctrl-o: ブラウザで開く / esc: キャンセル
# 行頭はPR作成者名(登場順に色分け)、ドラフトは赤い(D)付き
set -l sel (
    begin
        gh pr list --author '@me' --limit 30 --json number,title,headRefName,isDraft,author,url --template '{{range .}}{{.number}}{{"\t"}}{{.url}}{{"\t"}}0{{"\t"}}{{.author.login}}{{"\t"}}{{if .isDraft}}D{{end}}{{"\t"}}#{{.number}} {{.title}} ({{.headRefName}}){{"\n"}}{{end}}'
        gh pr list --search 'review-requested:@me' --limit 30 --json number,title,headRefName,isDraft,author,url --template '{{range .}}{{.number}}{{"\t"}}{{.url}}{{"\t"}}1{{"\t"}}{{.author.login}}{{"\t"}}{{if .isDraft}}D{{end}}{{"\t"}}#{{.number}} {{.title}} ({{.headRefName}}){{"\n"}}{{end}}'
    end | awk -F'\t' '!seen[$1]++' | sort -t (printf '\t') -k3,3 -k4,4f -k1,1nr | awk -F'\t' 'BEGIN{split("114 213 75 209 141 179 80 167 111 216 156 71",pal," ")}{u=$4; if(!(u in col)){col[u]=pal[(cnt++%12)+1]} d=($5=="D")?"\033[31m(D)\033[0m ":""; printf "%s\t%s\t\033[38;5;%sm%-14s\033[0m %s%s\n", $1, $2, col[u], u, d, $6}' | fzf --ansi --delimiter='\t' --with-nth=3.. --header 'Enter: checkout / ctrl-o: GitHubで開く' --bind 'ctrl-o:execute-silent(open {2})'
)
and gh pr checkout (echo $sel | cut -f1)
