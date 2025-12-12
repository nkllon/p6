
# Oracle Primavera P6 / P6 EPPM — 21+1 Dimensional Parse

## 0. Scope

Target: Oracle Primavera P6, especially **P6 Enterprise Project Portfolio Management (EPPM)** as a Java/J2EE, multi‑tier, web‑based PPM platform with desktop companions and reporting/analytics add‑ons.

Focus: how P6 behaves when viewed through a **21+1 dimensional Fort / SCIG lens**—where each dimension is a systemic “stress / invalid‑state” axis rather than a feature checklist.

> NOTE: Dimension labels here are intentionally generic and **provisional**. They’re chosen to be plausible Fort‑style dimensions you can later re‑bind to the exact canonical 21+1 set.

## 1. Working 21+1 Dimension Set

Provisional dimension names (D1–D21) plus meta‑dimension (D+1). These are mapped to your canonical Fort 21+1 vocabulary via `ontology/dimension-map.ttl` and can be replaced by canonical IRIs through ontology imports.

1. **D1: Time / Schedule Integrity**  
2. **D2: Cost / Financial Integrity**  
3. **D3: Scope / WBS Coherence**  
4. **D4: Resource & Capacity Alignment**  
5. **D5: Risk & Uncertainty Management**  
6. **D6: Data Model & Integration Surfaces**  
7. **D7: Configuration & Change Management**  
8. **D8: Governance & Portfolio Alignment**  
9. **D9: Security & Access Control**  
10. **D10: Compliance & Auditability**  
11. **D11: Performance & Scalability**  
12. **D12: Resilience & Continuity**  
13. **D13: UX / Human Factors (Planner vs Team)**  
14. **D14: Automation & Orchestration Surfaces**  
15. **D15: Analytics, Reporting & Feedback Loops**  
16. **D16: Multi‑Project / Program Coupling**  
17. **D17: Vendor / Ecosystem Lock‑in Pressure**  
18. **D18: Implementation & Rollout Complexity**  
19. **D19: Operability / Admin Ergonomics**  
20. **D20: Extensibility & Customization**  
21. **D21: Multi‑Agent / LLM‑Readiness**  

**D+1: Systemic Continuous Invalid‑state Gap (SCIG / “Goblin”)**  
How easy it is for the socio‑technical system built on P6 to drift into invalid states without being noticed, detected or corrected—across all other dimensions.

The ontology binds P6 to these dimensions via `p6:stressesDimension`, `p6:guardsDimension`, and `p6:exposesSurfaceOnDimension` relations.

## 2. P6 Quick Characterization (as a Fort Entity)

- **Entity type:** Enterprise Project & Portfolio Management (EPPM) platform  
- **Primary form:** Multi‑tier J2EE web app + desktop client + reporting DB  
- **Core use cases:**  
  - CPM scheduling and critical path analysis  
  - Resource/capacity planning at portfolio scale  
  - Integrated cost & schedule control  
  - Risk registers, what‑if scenarios, baselines  
  - Progress capture (Team Member / timesheets)  
  - Portfolio selection / prioritization and program‑level oversight  
- **Deployment pattern:**  
  - Presentation tier (web UI, applets in older releases)  
  - J2EE middle tier for business logic & job services  
  - RDBMS data tier (Oracle / SQL Server)  
  - Optional analytics/reporting DB, OBIEE / BI Publisher, integrations

## 3. Dimensional Pass

### D1: Time / Schedule Integrity

Where P6 shines natively: CPM, dependencies, calendars, baselines, critical path, float, schedule risk when used with risk add‑ons. It’s fundamentally a **schedule‑first** tool.

- Strength: rich activity / WBS / relationship modeling, multiple projects open, portfolio rollups. 
- Goblin: schedule integrity is **planner‑centric**—if upstream data, constraints and change control are sloppy, P6 just gives you a beautifully wrong schedule.

**Fort take:** P6 is almost maximal along D1 in terms of representational power, but actual SCIG is determined by how tightly you couple P6 to requirements, contracts, and field data capture.

### D2: Cost / Financial Integrity

P6 supports cost accounts, budgets, actuals and earned value when wired to either manual updates or downstream ERP/finance.  

- Strength: can model cost at activity, WBS, project and portfolio levels; supports top‑down budgets and bottom‑up actuals.  
- Goblin: cost truth usually lives in ERP (Oracle, SAP, etc.). If the integration is weak, P6 becomes a **shadow ledger**—perfect for drift between “project cost” and “real money.”

### D3: Scope / WBS Coherence

WBS and OBS are first‑class citizens. You can encode scope at a decent level of granularity, but P6 is not a requirements management tool.

- Strength: WBS / activity breakdowns and coding structures.  
- Goblin: no native semantic link to formal requirements, specifications or contractual statements of work. Traceability gaps become SCIG hot‑spots.

### D4: Resource & Capacity Alignment

This is one of the main selling points of P6: resource and role loading, leveling, and smoothing across large portfolios.

- Strength: rich resource/capacity views, optimization, scenario analysis.  
- Goblin: the **truth** of resource availability is social and organizational. If HR systems, skill taxonomies, and actual calendars are off, the model will converge to a beautiful fiction.

### D5: Risk & Uncertainty Management

P6 supports risk registers and can plug into risk analysis tooling.

- Strength: native risk objects, qualitative/quantitative scoring, some schedule risk integration.  
- Goblin: risk often becomes a documentation ritual rather than an operational control loop; limited out‑of‑the‑box automation of risk→control→schedule impact feedback.

### D6: Data Model & Integration Surfaces

Multi‑tier J2EE app with web services, APIs, reporting DB and connectors to OBIEE, ERP, content management systems and more.

- Strength: reasonably mature integration story (RDBMS, web services, reporting DB).  
- Goblin: schema is complex, legacy‑shaped and vendor‑shaped. LLM/graph‑friendly semantics exist only after deliberate modeling work.

### D7: Configuration & Change Management

P6 supports enterprise data structures, codes, calendars, security profiles, and project baselines.

- Strength: central admin of global data; security roles; baselines.  
- Goblin: heavy configuration surface area; changes ripple widely. Without disciplined configuration governance, the “enterprise coding scheme” decays.

### D8: Governance & Portfolio Alignment

Portfolio selection, prioritization, capacity vs demand, and performance thresholds are design targets.

- Strength: portfolio and program views; ability to align projects with strategic objectives and thresholds.  
- Goblin: governance quality is organizational, not technical. Tool can show you a red dashboard; it cannot make executives act sanely.

### D9: Security & Access Control

Role‑based security, permissions, project and data partitioning.

- Strength: reasonable enterprise‑grade access control.  
- Goblin: historic dependence on browser plug‑ins / applets in older stacks; integration with SSO/IDP can be non‑trivial; fine‑grained controls can become unusable if not well‑designed.

### D10: Compliance & Auditability

Audit logs, baselines, and reporting DB support compliance scenarios (SOX, internal audit, contract checks).

- Strength: structured data, explicit baselines and status snapshots.  
- Goblin: mapping “tool events” to actual regulatory obligations is non‑trivial; often needs external evidence management and document control systems.

### D11: Performance & Scalability

Explicitly architected as a scalable J2EE platform with horizontal and vertical scaling options.

- Strength: can scale to thousands of users and large project portfolios when properly sized.  
- Goblin: mis‑sizing or badly tuned queries (custom reports, extensions) create chronic latency goblins that users interpret as “P6 sucks,” even if the design is fine.

### D12: Resilience & Continuity

Depends mostly on infrastructure choices: clustering, DB RAC, backups, DR.

- Strength: supports high‑availability deployments with clustering.  
- Goblin: complexity of full HA/DR setup; tight coupling to RDBMS means restore/rollback semantics must be carefully worked out with ERP and other integrations.

### D13: UX / Human Factors (Planner vs Team)

Planner UX is feature‑rich but heavy; casual team member UX is more constrained via Progress Reporter / timesheet portals.

- Strength: planners get a powerful workstation; team members can submit status via simple interfaces.  
- Goblin: steep learning curve; high cognitive load; high dependence on a few “wizard” schedulers; frequent divergence between what P6 says and what the field believes.

### D14: Automation & Orchestration Surfaces

Background jobs (summarizer, leveler, job service), APIs, and reporting DB enable automation.

- Strength: can automate summarization, analytics refresh, data feeds.  
- Goblin: no native “event bus” or policy engine; orchestration is typically bolted‑on via custom scripts, ESBs, or LLM/agent frameworks you provide.

### D15: Analytics, Reporting & Feedback Loops

Reporting DB, OBIEE / BI Publisher, dashboards, KPIs, earned value, custom reports.

- Strength: strong reporting story for classical PM metrics.  
- Goblin: analytics are mostly descriptive/historical; predictive and prescriptive feedback loops require external data science / AI capabilities.

### D16: Multi‑Project / Program Coupling

Core competence: P6 is built for program/portfolio coupling and roll‑up views.

- Strength: handles large programs, multi‑project dependencies, and portfolio views.  
- Goblin: tight coupling makes systemic failure modes more catastrophic—bad calendars, wrong global codes, or mis‑modeled dependencies produce synchronized wrongness.

### D17: Vendor / Ecosystem Lock‑in Pressure

Classic enterprise Oracle story.

- Strength: deep integration with other Oracle products; long‑lived ecosystem of partners and skills.  
- Goblin: switching costs; incentive to centralize on Oracle stack even when sub‑optimal; “if all you have is a P6 hammer” pressure.

### D18: Implementation & Rollout Complexity

Requires significant design, configuration, training, and change management.

- Strength: can represent complex organizations and portfolios if designs are good.  
- Goblin: botched implementation leaves a scarred user base that never fully trusts the platform again.

### D19: Operability / Admin Ergonomics

Admins manage users, global data, security profiles, calendars, codes, etc.

- Strength: central administration, scripting and DB access possible.  
- Goblin: fragile admin UX, many levers; hard to reason about global impact of some changes; knowledge concentrated in a few “P6 priests.”

### D20: Extensibility & Customization

APIs, custom fields, user‑defined data, add‑ons and integrations.

- Strength: highly extensible for traditional dev shops.  
- Goblin: customization can fossilize around local quirks, increasing upgrade friction and SCIG.

### D21: Multi‑Agent / LLM‑Readiness

Out of the box, P6 is not LLM‑native; it’s a legacy but structured environment.

- Strength: relational schema + well‑defined domain concepts make it a prime target for an ontology overlay (your Fort layer) and LLM‑powered agents.  
- Goblin: complexity/opacity of schema; lack of native graph/semantic interfaces; risk of agents amplifying legacy modeling errors.

### D+1: SCIG / Goblin Summary

P6 is a **powerful but unforgiving bow‑tie**:

- Left side: requirements, contracts, constraints, risk, resource reality.  
- Knot: P6 schedule/resource/cost model.  
- Right side: execution, field reality, finances, outcomes.

If you hold the “cat” (constraints, semantics, governance) tightly, P6 behaves like a very strong stabilizing constraint. If you don’t, it becomes a **high‑throughput invalid‑state compiler**: it makes the wrong world extremely legible and easy to act on.

## 4. Fort‑Style Roles and Surfaces

- **P6 as Artifact:** a strongly‑typed, high‑value, high‑risk artifact in the Fort, to be surrounded by ontologies, validation, and monitoring agents.  
- **Surfaces for agents:**  
  - DB schema → RDF/ontology projection  
  - Job logs / scheduler runs → observability  
  - Portfolio dashboards → narrative compression for execs  
  - Risk & issues → goblin harvest surface  
- **Controls:**  
  - SHACL / constraint checks on the projected P6 graph  
  - Goblin score by dimension (e.g., schedule integrity vs cost integrity)  
  - Multi‑agent scenario generators that perturb calendars, resource availability, and risk to test resilience of the P6 model.

## 5. How to Use This Bundle

1. Load `ontology/p6-21plus1.ttl` into your Fort graph store.  
2. Map your actual P6 DB (or export) into instances of the ontology classes.  
3. Attach SCIG/goblin scores to real projects and portfolios.  
4. Use the diagrams as anchor views when explaining “why P6 is dangerous and powerful” to stakeholders.  
5. Iterate: adapt dimension names to your canonical 21+1 and wire into existing Fort modules.
