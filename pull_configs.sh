mkdir -p ./services
while IFS= read -r line || [[ -n "$line" ]]; do
    service_name="$(basename $line .git)"
    service_dir="./services/$service_name"
    mkdir -p $service_dir
    git archive --remote=$line HEAD pyproject.toml | tar xO > "$service_dir/pyproject.toml"
done < ./services.txt
