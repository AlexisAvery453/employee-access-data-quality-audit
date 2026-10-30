# Employee Access and Data Quality Audit — Findings Report

## Purpose
Five SQL checks were performed against a synthetic sample SQLite database to identify incomplete approval information, summarize access assignments, and locate records for further review.

## Finding 1 — Missing approval information
**Result:** 6 access-grant records.

**Observation:** Six records have NULL in `approved_by`; the returned records include Read-Only and Standard User roles.

**Interpretation:** The database has no recorded approver for these grants. This does not establish that approval was never granted.

**Recommended follow-up:** Verify whether approval documentation exists elsewhere or whether the records need correction.

**Evidence:** [Query 1 — Missing approval information](../Evidence/query-01-missing-approvals.png)

## Finding 2 — Administrator access grants
**Result:** 15 records.

**Observation:** Fifteen records have the role `Admin`.

**Interpretation:** This is a count of administrator-role grant records, not proof of excessive or inappropriate permissions.

**Recommended follow-up:** Review associated users, actual permissions, job responsibilities, and approval documentation.

**Evidence:** [Query 2 — Administrator grants](../Evidence/query-02-admin-grants.png)

## Finding 3 — Terminated users with access-grant records
**Result:** 14 access-grant records.

**Observation:** Fourteen grant records are associated with users whose status is `Terminated`. Some users appear in multiple rows.

**Interpretation:** These records warrant review, but the query does not establish whether the grants remain active or whether offboarding requirements were missed.

**Recommended follow-up:** Verify current grant validity and whether access removal was completed.

**Evidence:** [Query 3 — Terminated users](../Evidence/query-03-terminated-users.png)

## Finding 4 — Users with multiple access grants
**Result:** 41 users.

**Observation:** Forty-one user IDs have more than one access-grant record.

**Interpretation:** Multiple grants may be appropriate for an employee's responsibilities. The count alone does not demonstrate excessive access or a least-privilege violation.

**Recommended follow-up:** Compare assigned roles with job responsibilities and review combinations that may require additional scrutiny.

**Evidence:** [Query 4 — Multiple grants](../Evidence/query-04-multiple-grants.png)

## Finding 5 — Users without matching access grants
**Result:** 4 users.

**Observation:** The query identified Rosa Nguyen (user_id 8), Noah Chen (user_id 25), Marcus Brooks (user_id 44), and Jordan Vega (user_id 57).

**Interpretation:** These user records have no matching record in `access_grants`. This may be expected depending on responsibilities and how access is managed.

**Recommended follow-up:** Confirm whether these users require system access and whether access is managed elsewhere.

**Evidence:** [Query 5 — Users without matching grants](../Evidence/query-05-users-without-grants.png)

## Consolidated results
| Audit check | Result |
|---|---:|
| Missing approval information | 6 records |
| Administrator access grants | 15 records |
| Terminated users with access-grant records | 14 records |
| Users with multiple access grants | 41 users |
| Users without matching access-grant records | 4 users |

These are separate checks and must not be summed as unique affected employees.

## Overall assessment
The checks demonstrate how SQL can identify missing information, summarize access assignments, and locate records for follow-up. The results are a starting point for access-governance and data-quality review, not proof of unauthorized access, excessive permissions, policy violations, or failed offboarding. Further validation against business requirements, approval evidence, actual permissions, and access-removal records is necessary.

## Skills demonstrated
SQL filtering and aggregation; joins; grouping; NULL checks; interpreting results; and communicating technical findings in business language.

## Scope and limitations
This is an educational portfolio exercise using synthetic practice data, not a formal organizational security audit.
