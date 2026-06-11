# Анализ оттока клиентов банка

## Цель проекта
Выявить факторы, влияющие на отток клиентов банка, и предложить рекомендации по удержанию.

## Данные
- Источник: Kaggle (Bank Customer Churn Prediction)
- 10 000 клиентов, 14 признаков
- Целевая переменная: `Exited` (1 - ушёл, 0 - остался)

## Инструменты
- **SQL** (SQLite) - расчёт ключевых метрик и группировок
- **Excel** - сводные таблицы, графики
- **Power BI** - интерактивный дашборд

## SQL-запросы
Все запросы находятся в папке [`sql/`](sql/). Они вычисляют:
- общий процент оттока (`churn_rate_overall`)
- отток по странам (`churn_by_geography`)
- отток по возрастным группам (`churn_by_age_group`)
- отток по количеству продуктов (`churn_by_products`)
- отток по активности (`churn_by_activity`)

Пример запроса (отток по странам):
```sql
SELECT 
    Geography,
    COUNT(*) AS TotalCustomers,
    SUM(Exited) AS Churned,
    AVG(Exited) * 100 AS ChurnRatePercent
FROM churn
GROUP BY Geography
ORDER BY ChurnRatePercent DESC;
