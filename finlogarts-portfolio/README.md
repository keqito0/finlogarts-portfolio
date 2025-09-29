# FinLogArts — BI & Analytics (BigQuery + Looker)

Projeto de portfólio com dados fictícios (`meli-bi-data.TMP.*`) para demonstrar **SQL (BigQuery)** e **dashboard (Looker Studio)**.

## 🔗 Links
- **Dashboard (Looker Studio):** _adicione aqui a URL pública_
- **One‑pager (PDF):** _adicione aqui o link do PDF no GitHub (ex.: /docs/onepager.pdf)_

## 📦 Estrutura
```
finlogarts-portfolio/
├─ sql/
│  ├─ 01_base_quality_checks.sql
│  ├─ 02_views_kpis.sql
│  ├─ 03_views_funil.sql
│  └─ 04_views_sla_logistica.sql
├─ docs/
│  └─ prints/              # 5 imagens usadas no one-pager
├─ samples/                # 10 linhas de amostra por tabela (opcional)
├─ .gitignore
├─ LICENSE
└─ README.md
```

## ▶️ Como reproduzir
1. Abra o BigQuery (Standard SQL).  
2. Ajuste os parâmetros **ano/região** no topo de cada `.sql` (CTE `params`).  
3. Execute `01_base_quality_checks.sql` (auditoria).  
4. Execute `02_views_kpis.sql`, `03_views_funil.sql`, `04_views_sla_logistica.sql`.  
5. Publique os resultados no **Looker Studio** e gere 5 **prints** para `/docs/prints`.

## 🧪 Checklist de Qualidade
- Datas negativas (envio < pedido) → investigar.  
- Nulos críticos (order_id, customer_id, datas) → corrigir/filtrar.  
- Duplicidades de pedido → garantir unicidade.  
- Cap de tempos 0–120 dias para SLA; refunds atrelados ao **mesmo ano** da entrega.

## 🧱 Dicionário (exemplo resumido)
- `orders_kq(order_id, customer_id, order_date, status)`  
- `shipments_kq(order_id, ship_date)`  
- `deliveries_kq(order_id, delivery_date)`  
- `payments_kq(order_id, payment_date, amount)`  
- `refunds_kq(order_id, refund_date, amount)`  
- `customers_kq(customer_id, region)`

## 📸 Prints do Painel (5 visuais)
- `clientes_ativos.png`
- `faturamento_mensal_2024.png`
- `ticket_regiao.png`
- `funil_pedidos.png`
- `sla_mensal.png`

## 📝 Licença
MIT — livre para uso educacional.