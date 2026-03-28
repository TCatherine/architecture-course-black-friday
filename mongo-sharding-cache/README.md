# Инициализация шардирования в MongoDB

## Шаги инициализации

1. Инициализация сервиса конфигурации
2. Инициализация шарда 1
3. Инициализация шарда 2
4. Инициализация сервиса маршрутизации
5. Создание базы `somedb` и коллекции `helloDoc`
6. Заполнение его тестовыми данными

## Команда для инициализации


```bash
bash mongo-init.sh
```

## Команда для тестирования

```bash
bash test.sh
```

## Результаты во время тестирования

```bash
Testing endpoint 1...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 58791  100 58791    0     0  56855      0  0:00:01  0:00:01 --:--:-- 56912

real    0m1.047s
user    0m0.005s
sys     0m0.005s

-----------------------------------------------------------
Testing endpoint 2...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 58791  100 58791    0     0  8675k      0 --:--:-- --:--:-- --:--:-- 9568k

real    0m0.025s
user    0m0.007s
sys     0m0.007s

-----------------------------------------------------------
Testing endpoint 3...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 58791  100 58791    0     0  8996k      0 --:--:-- --:--:-- --:--:-- 9568k

real    0m0.019s
user    0m0.005s
sys     0m0.005s
```