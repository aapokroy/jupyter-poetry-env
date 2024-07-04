while IFS= read -r line || [[ -n "$line" ]]; do
    service_name="$(basename $line .git)"
    service_dir="./services/$service_name"
    poetry --directory=$service_dir --no-interaction --no-cache install --no-root
    poetry --directory $service_dir run pip install ipykernel
    poetry --directory $service_dir run ipython kernel install --name $service_name --user
done < ./services.txt