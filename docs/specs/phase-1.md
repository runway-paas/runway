# Phase 1 spec: Foundations

**Dates:** 9 November to 8 December 2026 (Sprints 1 and 2)
**Owner:** product lead
**Status:** Draft, for review

## Goal
Set up everything we need to build Runway safely and in a steady rhythm, before writing any platform features.

## Why this comes first
Runway is a two-person project done in spare time. If the basics are shaky (unprotected main, no CI, unclear process, uncontrolled cloud costs), every later phase gets slower and riskier. One month spent on foundations makes months 2 to 6 faster.

## Done when (8 December)
We can both go from an issue to a reviewed, merged PR on a protected `main`, spin up a local Kubernetes cluster with one command, and run Terraform against Azure with shared remote state, with costs capped by a budget alert.

Specifically:
- [ ] `main` is protected: PR plus 1 approval, no bypassing, no force pushes
- [ ] PR template, CONTRIBUTING.md and issue templates are in the repo
- [ ] Project board has 10+ issues covering Sprints 1 and 2
- [ ] Each of us has merged at least 3 reviewed PRs
- [ ] Azure subscription set up with a monthly budget alert
- [ ] One script creates a local kind cluster, documented in the README
- [ ] Terraform skeleton in `infra/` with state stored in Azure Storage
- [ ] CI runs `terraform fmt` and `terraform validate` on every PR and is required to merge
- [ ] Go API skeleton exists (builds and runs, no features yet)

## In scope
| Area | Deliverable | Lead |
|---|---|---|
| Repo and process | Branch protection, templates, CONTRIBUTING, board | Product |
| Planning | This spec, issues for Sprints 1 and 2 | Product |
| Cloud | Azure subscription, resource group, budget alert | Product |
| Local dev | kind cluster script and README section | Platform |
| Infrastructure | Terraform skeleton with remote state | Platform |
| CI | fmt and validate checks, made required | Platform |
| API | Go API skeleton | Product |

## Out of scope (and when it comes)
- Go API and CLI features beyond a skeleton (month 2)
- Build Jobs, Gateway API, cert-manager (month 2)
- AKS clusters and any real deploys (month 3)
- AI ops assistant: deliberately left out until deploys work end to end, so it doesn't distract from the platform (month 3)
- Dashboard, monitoring, outside users (months 4 and 5)

## How we'll measure it
Our north-star metric (time from `git push` to a live HTTPS URL) can't be measured until month 3. In phase 1 we track how healthy our way of working is:

| Metric | Target | Why |
|---|---|---|
| Reviewed PRs merged per person | 3 or more | Proves the review habit is real, not just written down |
| Review turnaround | Within 48 hours | A slow review is the main thing that stalls a two-person team |
| Azure spend | Under £10 for the month | Shows teardown discipline before clusters get expensive |

## Risks
| Risk | Effect | Mitigation |
|---|---|---|
| Limited spare time (4 to 5 hours a week each) | Sprint goals slip | Small PRs, cut order agreed in the sprint plan |
| New tools (Terraform, Kubernetes) take longer to learn | Platform tasks overrun | Terraform state and CI check can move to Sprint 2 |
| Azure resources left running | Unexpected cost | Budget alert, "Azure up/down" in Slack, destroy after every session |

