# Jupyter with poetry enviroments

При запуске из сервисов в `services.txt` выгружаются конфиги `pyproject.toml` и под каждый конфиг создаётся отдельное ядро со своим окружением.

## Deploy
1. В файл `services.txt` записать ссылки на репозитории из которых нужно выгрузить конфиги
2. В `Dockerfile` изменить дефолтоное значение `token`
3. `> bash run.sh`