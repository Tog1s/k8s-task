# Kubernetes test task

## Основные задачи

- [x] Развернуть k8s кластер.
- [x] Развернуть Grafana с основными метриками кластера.
- [x] Развернуть Prometheus.
- [x] Развернуть mysql с PVC.
- [x] Включить логирование медленных запросов.
- [x] Настроить экспорт логов.
- [x] Настроить уведомления.

## Создание и управление инфраструктурой для Yandex Cloud

- Все задачи rake
```bash
rake -T 
```
- Валидация terraform
```bash
rake test:terraform
```
- Развертывание инфраструктуры
```bash
rake tfa
```
- Деплой чартов
```bash
rake install_charts
```
- Удаление инфраструктуры
```bash
rake tfd
```
