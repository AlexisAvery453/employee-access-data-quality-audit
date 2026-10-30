# Employee Access and Data Quality Audit

## Project overview
This portfolio project uses SQL and a sample SQLite database to examine employee access-grant records, identify data-quality gaps, and highlight records for further access-governance review.

## Objectives
- Identify access grants with missing approval information.
- Count administrator access-grant records.
- Identify grant records associated with terminated users.
- Find users with multiple access-grant records.
- Identify users without matching access-grant records.

## Tools
- SQLite
- DB Browser for SQLite
- SQL
- GitHub

## Dataset
The supplied practice database, `access_audit_practice.db`, contains three tables: `users` (60 records), `access_grants` (114 records), and `systems` (10 records). The dataset is synthetic practice data, not real employee or patient records.

## Audit results
| Audit check | Result |
|---|---:|
| Missing approval information | 6 records |
| Administrator access grants | 15 records |
| Terminated users with access-grant records | 14 records |
| Users with multiple access grants | 41 users |
| Users without matching access-grant records | 4 users |

The counts were checked against the SQLite database. The checks are independent and must not be added together as a count of unique affected employees.

## Repository contents
- `SQL/employee_access_audit_queries.sql` — five final audit queries.
- `Findings/audit_findings.md` — observations, interpretations, and recommended follow-up.
- `Evidence/` — screenshots of the five final query outputs.
- `Database/access_audit_practice.db` — synthetic sample SQLite source database.

## SQL concepts demonstrated
`SELECT`, `WHERE`, `COUNT`, `IS NULL`, `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, and `HAVING`.

## Limitations
This is a sample-data portfolio exercise, not a formal organizational audit. Query results identify records for review; they do not independently prove unauthorized access, excessive permissions, policy violations, or failed offboarding. Approval evidence, actual permissions, business requirements, and access-removal status would need separate validation.
