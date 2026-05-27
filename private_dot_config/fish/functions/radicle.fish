function radicle --description 'start/stop Radicle containers (node + explorer profiles)'
    set -l compose $HOME/projects/personal/radicle-in-containers/compose.yaml
    switch "$argv[1]"
        case start
            docker compose -f $compose --profile node --profile explorer up --detach
        case stop
            docker compose -f $compose --profile node --profile explorer down
        case '*'
            echo "Usage: radicle <start|stop>"
            return 1
    end
end
